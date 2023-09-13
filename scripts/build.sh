
CONFIGURED_RELEASE_BRANCHES=(
    "refs/heads/main"
)

GITHUB_REF="refs/heads/main"


for branch in "${CONFIGURED_RELEASE_BRANCHES[@]}"; do
    if [[ "$GITHUB_REF" =~ .*"$branch" ]]; then
        echo "Identified release branch: $branch"
        exit 0
    fi
done

