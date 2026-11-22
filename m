Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4571E606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 18:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WbnHKZqA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Lc0K2vI9;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Sp7YFbJl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MFh8YMfOZzm6SgOifm9PkexVzUla952anT96VdmLh+w=; b=WbnHKZqAknJZfkbsnptrkgbPsw
	cqFwyvju3Su2YMtheD1kWGNfY5yVrbRBvNEJOkaHzdxTxkLKCG+E0ADfEsTfSratXFMbUisGQLfUL
	CoD2p2n2e6QoMd4tY6ubqaqeLaXE+VuG373AiPbwbE+AL6WFJOTjYp937vB95juBF8wJnlvVgik8P
	rrBgsw0btxlcc4dTVgWxTOUZjdP0J45zbc5z1MU6fFoYWfIwRkFJS32QVtWit9nxhjXHI82WfJQ2D
	P0rs9/lFhZu8Vo569y9mmyzFDDuPW8N6Q9sCwEfmZwyZFaO5eu6M3VqUg+HBSvtKhlGS09NKl026y
	AI9P8jyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCal-00000001Zst-1CEI;
	Sun, 22 Nov 2026 18:47:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYx-00000001YXH-27D1
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 22 Nov 2026 18:45:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MFh8YMfOZzm6SgOifm9PkexVzUla952anT96VdmLh+w=; b=Lc0K2vI9dcbDBJRcuQ2dXo5F96
	Ku3sS2TS/QWNzNeiHEO59TcfAsTwRVTKI52zG0weVPokWIgC0tK8Oep71WPgDBzVmsao6MWdPpPjY
	xA0NYehqmqFv3vXcG/rTFFOter3+kjX08FRQbyaLKiGM1yI4CK8zPK1NPWEQ0PG4buge66NP8vKH5
	s00klDsQpaLKyfUshon8pEG9hCdoINa/LZG8p+1hkooS4kvUGpQnkU9cyUY9ynMrnKLNV5tdTLmwr
	AAQG9qDjjMSlLOmU8QpwHOZww0Im6JRU+M+dKsGBnzG9xCLeKvrUYOeIwarWxPeX5hrs/L5RXvKL5
	LrFOF3Sg==;
Received: from mail-pj1-x1045.google.com ([2607:f8b0:4864:20::1045])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYu-00000002RFP-3s6g
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 18:45:18 +0000
Received: by mail-pj1-x1045.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso1952027a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 10:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373115; x=1795977915; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MFh8YMfOZzm6SgOifm9PkexVzUla952anT96VdmLh+w=;
        b=Sp7YFbJlopvdaeFf+xbrlihK4QL+ssLfcjZ/fsvsSg3kGo5hK3G55pS8MLn/kwx7wN
         nD0J+SPSJHmVwkv7q2lv5N5KNwigZDQwg+yVSoaYrpBRuOV4t7+j7TB+iY0LqybI3XgX
         BZD/G1qCQ1pj9KF1pOyquhyF9ZWhznbYkYzr5C+yhUuCo7qRp+qSNkXMbTkX5LDk0M+Z
         XmiCB5d6RrWL5NgAKJBWHyVZMhJqicvXTSjygMysKSFZJi0C5t05wI5OSXjwd8Buym5z
         mYQt79M4dnaTmuzXmwQPU3IqAFDq9Oq1A8DNJy3tpnKJXvHmrWAeTqw/KcIMGLYIWqyB
         vYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373115; x=1795977915;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MFh8YMfOZzm6SgOifm9PkexVzUla952anT96VdmLh+w=;
        b=AgEeNiddq0BouxGZxmygD0Rjgf7Mmw0SLzC1gIBbeKgs3gXwbdQpFuMxkc1hBzuWCo
         rSOrphlv1kjSnLJN5GnWy2nPGIplVoqI2uC14NQX3j0Jnb4BjxKz6VB3JNclzilqwIFe
         tjsxp1g5JlDw81uXBliUEz5TdlGZpZtjvDdAckj+G119A8OUZxHMrwqy4Sa34wST4cal
         HbNKZ7lQYXzE5M9Ucnzjg2+/Z4sF9i4f6yvSHLzXn9FXZl7k9egwPyA2GkJTNvppsTDV
         +7PijGrgcP8lpuq/wm0rpy/SikeQB4P99e3U+I9KqpQa7ag8UzOBttfeDBE7Ty6gl3hU
         n/5g==
X-Forwarded-Encrypted: i=1; AL+hErFpi1cFgZQufnErtdkxFHp+p/nPNZOdllo4kyXbe8NR7/jWKUOTXEDLVxbHW5DetbU5dvoGGdQ8HEUdnk8pJspL@lists.infradead.org
X-Gm-Message-State: APuU4Z/xqHAbG1cLgsgFqg03+RS1O/Ddf/7q4zeT6zcxubxlQbOtuLRQ
	05BecJYcSK91cEX7xNNLRuOYOyfhiLad6+CLA+jSrdwQvC2zSxUdM95I/HOc6amO5xX9wGjq83K
	np2XqeHjozyk2EngPoyFesw==
X-Received: from pjbsn14.prod.google.com ([2002:a17:90b:2e8e:b0:3b0:944b:61fe])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4a47:b0:3b3:fc1f:a5c4 with SMTP id 98e67ed59e1d1-3b41c8dc821mr8713904a91.20.1795373114192;
 Sun, 22 Nov 2026 10:45:14 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:48 +0000
In-Reply-To: <20261122184453.2668189-1-jthoughton@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261122184453.2668189-15-jthoughton@google.com>
Subject: [PATCH v3 14/19] selftests/mm: Add HugeTLB vmemmap optimization
 stress test
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, 
	James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_184517_026531_5022DD0C 
X-CRM114-Status: GOOD (  25.82  )
X-Spam-Score: -7.6 (-------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a script that stresses HugeTLB vmemmap optimization (HVO), in
particular on architectures that update the vmemmap in place while it
may be concurrently accessed:

  - Check that optimizing N folios frees exactly N * (vmemmap pages per
    folio - 1) vmemmap pages (per nr_memmap_pages and
    nr_memmap_boot_pages), and that restoring them gives them back.
  - Repeatedly optimize and restore folios by resizing the hugepage pool,
    while concurrently reading struct pages through /proc/kpageflags and
    /proc/kpagecount, compacting memory, and optionally reading
    page_owner and offlining/onlining memory blocks.
  - Do the same with fail_hugetlb_vmemmap_pte fault injection enabled,
    if available, to exercise the rollback and partially-optimized folio
    paths.

After each phase, the pool must shrink back to its original size and the
memmap accounting must return to its baseline. Finally, the kernel log
must not contain warnings or oopses.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 tools/testing/selftests/mm/Makefile           |   2 +
 .../selftests/mm/hugetlb_vmemmap_stress.sh    | 380 ++++++++++++++++++
 .../selftests/mm/ksft_hugetlb_vmemmap.sh      |   4 +
 tools/testing/selftests/mm/run_vmtests.sh     |   4 +
 4 files changed, 390 insertions(+)
 create mode 100755 tools/testing/selftests/mm/hugetlb_vmemmap_stress.sh
 create mode 100755 tools/testing/selftests/mm/ksft_hugetlb_vmemmap.sh

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index 675ec57d47de..9ec348902743 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -150,6 +150,7 @@ TEST_PROGS += ksft_cow.sh
 TEST_PROGS += ksft_gup_test.sh
 TEST_PROGS += ksft_hmm.sh
 TEST_PROGS += ksft_hugetlb.sh
+TEST_PROGS += ksft_hugetlb_vmemmap.sh
 TEST_PROGS += ksft_hugevm.sh
 TEST_PROGS += ksft_kmemleak_confirm.sh
 TEST_PROGS += ksft_kmemleak_dedup.sh
@@ -182,6 +183,7 @@ TEST_FILES += test_hmm.sh
 TEST_FILES += va_high_addr_switch.sh
 TEST_FILES += charge_reserved_hugetlb.sh
 TEST_FILES += hugetlb_reparenting_test.sh
+TEST_FILES += hugetlb_vmemmap_stress.sh
 TEST_FILES += test_page_frag.sh
 TEST_FILES += run_vmtests.sh
 
diff --git a/tools/testing/selftests/mm/hugetlb_vmemmap_stress.sh b/tools/testing/selftests/mm/hugetlb_vmemmap_stress.sh
new file mode 100755
index 000000000000..b64fdb3ed761
--- /dev/null
+++ b/tools/testing/selftests/mm/hugetlb_vmemmap_stress.sh
@@ -0,0 +1,380 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Stress test for HugeTLB vmemmap optimization (HVO).
+#
+# Phases:
+#   1. accounting: allocate N hugepages, check that nr_memmap_pages +
+#      nr_memmap_boot_pages drops by exactly N * (vmemmap pages per folio - 1),
+#      then free them and check it returns to the baseline.
+#   2. stress: churn the pool (optimize/restore) while concurrently reading
+#      struct pages (/proc/kpageflags, /proc/kpagecount), compacting memory,
+#      and optionally reading page_owner and offlining/onlining memory.
+#   3. pte-inject: like 2, with fail_hugetlb_vmemmap_pte enabled; this hits
+#      both the optimize rollback and the restore (partial HVO) paths.
+#
+# After each phase the pool is drained back to its original size, memmap
+# accounting must be back at the phase's baseline, and the kernel log must
+# not contain warnings/oopses.
+#
+# The fault-injection phases require CONFIG_FAIL_HUGETLB_VMEMMAP and
+# CONFIG_FAULT_INJECTION_DEBUG_FS, and are skipped otherwise.
+
+set -u
+
+KSFT_PASS=0
+KSFT_FAIL=1
+KSFT_SKIP=4
+
+size_kb=
+nr=16
+duration=60
+prob=20
+readers=4
+struct_page_size=64
+do_page_owner=0
+do_hotplug=0
+
+usage() {
+	cat <<EOF
+Usage: $0 [options]
+  -s KB     hugepage size in kB (default: default hugepage size)
+  -n N      number of hugepages to churn (default: $nr)
+  -t SEC    duration of each stress phase (default: $duration)
+  -p PCT    fault-injection probability in percent (default: $prob)
+  -j N      number of struct page reader processes (default: $readers)
+  -S BYTES  sizeof(struct page) (default: $struct_page_size)
+  -o        also read /sys/kernel/debug/page_owner during stress
+  -m        also offline/online memory blocks during stress (dissolves
+            free hugepages, exercising the restore path)
+
+For exact accounting checks, run on a hugepage size whose pool is
+initially empty (e.g. no boot-time reservations of that size).
+EOF
+	exit $KSFT_SKIP
+}
+
+while getopts "s:n:t:p:j:S:omh" opt; do
+	case $opt in
+	s) size_kb=$OPTARG ;;
+	n) nr=$OPTARG ;;
+	t) duration=$OPTARG ;;
+	p) prob=$OPTARG ;;
+	j) readers=$OPTARG ;;
+	S) struct_page_size=$OPTARG ;;
+	o) do_page_owner=1 ;;
+	m) do_hotplug=1 ;;
+	*) usage ;;
+	esac
+done
+
+log() { echo "# $*"; }
+skip() { echo "SKIP: $*"; exit $KSFT_SKIP; }
+
+failures=0
+fail() { echo "FAIL: $*"; failures=$((failures + 1)); }
+pass() { echo "PASS: $*"; }
+
+[ "$(id -u)" -eq 0 ] || skip "must be run as root"
+
+[ -r /proc/sys/vm/hugetlb_optimize_vmemmap ] ||
+	skip "HVO not supported (no vm.hugetlb_optimize_vmemmap)"
+[ "$(cat /proc/sys/vm/hugetlb_optimize_vmemmap)" = 1 ] ||
+	skip "HVO disabled (vm.hugetlb_optimize_vmemmap=0)"
+grep -q '^nr_memmap_pages ' /proc/vmstat ||
+	skip "no nr_memmap_pages in /proc/vmstat"
+
+[ -n "$size_kb" ] || size_kb=$(awk '/^Hugepagesize:/ {print $2}' /proc/meminfo)
+hp_dir=/sys/kernel/mm/hugepages/hugepages-${size_kb}kB
+[ -d "$hp_dir" ] || skip "no ${size_kb}kB hugepages"
+
+page_size=$(getconf PAGESIZE)
+vmemmap_pages=$(( size_kb * 1024 / page_size * struct_page_size / page_size ))
+freed_per_folio=$(( vmemmap_pages - 1 ))
+[ "$freed_per_folio" -gt 0 ] ||
+	skip "${size_kb}kB hugepages are not HVO-optimizable"
+
+dbgfs=/sys/kernel/debug
+mountpoint -q $dbgfs || mount -t debugfs none $dbgfs 2>/dev/null
+
+orig_nr=$(cat "$hp_dir/nr_hugepages")
+target_nr=$(( orig_nr + nr ))
+marker="hvo-stress-$$-$(date +%s)"
+tmpdir=$(mktemp -d)
+pids=()
+
+log "hugepage size ${size_kb}kB, page size $page_size"
+log "struct page size $struct_page_size"
+log "vmemmap pages/folio: $vmemmap_pages ($freed_per_folio freed by HVO)"
+log "pool: $orig_nr initially, churning between $orig_nr and $target_nr"
+[ "$orig_nr" -eq 0 ] ||
+	log "WARNING: pool not initially empty, accounting may be inexact"
+
+memmap_total() {
+	awk '/^nr_memmap_(boot_)?pages / {s += $2} END {print s + 0}' \
+		/proc/vmstat
+}
+
+set_nr() {
+	echo "$1" > "$hp_dir/nr_hugepages" 2>/dev/null
+	cat "$hp_dir/nr_hugepages"
+}
+
+# Shrink the pool back to orig_nr. Restore may transiently fail (e.g. with
+# fault injection active), so retry for a while.
+drain() {
+	local i cur surplus
+
+	for i in $(seq 20); do
+		# Pages whose vmemmap could not be restored are kept as free
+		# surplus pages, which shrinking nr_hugepages does not free.
+		# Writing the current size converts them back to persistent
+		# pages first.
+		set_nr "$(cat "$hp_dir/nr_hugepages")" > /dev/null
+		cur=$(set_nr "$orig_nr")
+		[ "$cur" -eq "$orig_nr" ] && return 0
+		sleep 1
+	done
+	surplus=$(cat "$hp_dir/surplus_hugepages")
+	fail "pool stuck at $cur hugepages ($surplus surplus)," \
+		"expected $orig_nr"
+	return 1
+}
+
+fa_dir() { echo "$dbgfs/$1"; }
+
+fa_enable() {
+	local d
+	d=$(fa_dir "$1")
+	echo 0 > "$d/verbose"
+	echo N > "$d/task-filter"
+	echo 1 > "$d/interval"
+	echo 1000000 > "$d/times"
+	echo "$prob" > "$d/probability"
+}
+
+# Disable and print the number of injected failures.
+fa_disable() {
+	local d left
+	d=$(fa_dir "$1")
+	echo 0 > "$d/probability"
+	left=$(cat "$d/times")
+	echo 0 > "$d/times"
+	echo $(( 1000000 - left ))
+}
+
+check_dmesg() {
+	local bad pat
+
+	pat='WARNING:|BUG[: ]|Oops|Unable to handle kernel'
+	pat+='|Internal error|KASAN:|UBSAN:'
+	pat+='|list_(add|del) corruption|page dumped because'
+	bad=$(dmesg | sed -n "/$marker/,\$p" | grep -E "$pat")
+	# Offlining a memory block that contains unmovable pages fails and
+	# dumps the offending page; that is expected with -m.
+	[ "$do_hotplug" -eq 1 ] &&
+		bad=$(echo "$bad" | grep -v 'page dumped because: unmovable page')
+	if [ -n "$bad" ]; then
+		fail "kernel log reports problems:"
+		echo "$bad" | head -20 | sed 's/^/#   /'
+	fi
+}
+
+## Workers
+
+churn() {
+	while :; do
+		set_nr "$target_nr" > /dev/null
+		set_nr "$orig_nr" > /dev/null
+	done
+}
+
+kpage_reader() {
+	while :; do
+		dd if=/proc/kpageflags of=/dev/null bs=4M status=none
+		dd if=/proc/kpagecount of=/dev/null bs=4M status=none
+	done
+}
+
+compactor() {
+	while :; do
+		echo 1 > /proc/sys/vm/compact_memory
+		sleep 1
+	done
+}
+
+page_owner_reader() {
+	while :; do
+		cat $dbgfs/page_owner > /dev/null
+	done
+}
+
+hotplugger() {
+	local blk state removable
+
+	while :; do
+		for blk in /sys/devices/system/memory/memory*; do
+			state=$(cat "$blk/state" 2>/dev/null)
+			removable=$(cat "$blk/removable" 2>/dev/null || echo 1)
+			[ "$state" = online ] || continue
+			[ "$removable" = 1 ] || continue
+			echo "$blk" >> "$tmpdir/hotplug"
+			# A signal aborts a pending offline_pages(). Use
+			# --foreground so that the writer stays in the worker's
+			# process group and is killed by stop_workers().
+			timeout --foreground 10 \
+				sh -c "echo offline > $blk/state" 2>/dev/null
+			echo online > "$blk/state" 2>/dev/null
+			sleep 1
+		done
+	done
+}
+
+start_workers() {
+	local i
+
+	# Start each worker in its own process group (job control), so that
+	# stop_workers() can kill the commands it is running as well.
+	set -m
+	churn & pids+=($!)
+	for i in $(seq "$readers"); do
+		kpage_reader & pids+=($!)
+	done
+	compactor & pids+=($!)
+	if [ "$do_page_owner" -eq 1 ]; then
+		if [ -r $dbgfs/page_owner ]; then
+			page_owner_reader & pids+=($!)
+		else
+			log "page_owner not available, not reading it"
+		fi
+	fi
+	[ "$do_hotplug" -eq 1 ] && { hotplugger & pids+=($!); }
+	set +m
+}
+
+# Stop the workers, including any command they are running (e.g. a dd of
+# /proc/kpageflags), so that nothing touches struct pages after a phase ends.
+stop_workers() {
+	local pid i alive
+
+	[ "${#pids[@]}" -gt 0 ] || return 0
+	for pid in "${pids[@]}"; do
+		kill -TERM -- "-$pid" 2>/dev/null
+	done
+	for i in $(seq 30); do
+		alive=0
+		for pid in "${pids[@]}"; do
+			kill -0 -- "-$pid" 2>/dev/null && alive=1
+		done
+		[ "$alive" -eq 0 ] && break
+		sleep 1
+	done
+	if [ "$alive" -eq 1 ]; then
+		log "WARNING: workers still running, killing them"
+		for pid in "${pids[@]}"; do
+			kill -KILL -- "-$pid" 2>/dev/null
+		done
+	fi
+	# Reap the workers only once they are gone, so that this cannot block.
+	wait "${pids[@]}" 2>/dev/null
+	pids=()
+}
+
+cleanup() {
+	local blk t
+
+	stop_workers
+	for t in fail_hugetlb_vmemmap_pte; do
+		[ -d "$(fa_dir $t)" ] && fa_disable $t > /dev/null
+	done
+	if [ -f "$tmpdir/hotplug" ]; then
+		sort -u "$tmpdir/hotplug" | while read -r blk; do
+			[ "$(cat "$blk/state")" = online ] ||
+				echo online > "$blk/state" 2>/dev/null
+		done
+	fi
+	# drain() also frees free surplus pages left by failed restores.
+	drain > /dev/null
+	rm -rf "$tmpdir"
+}
+trap cleanup EXIT
+trap 'exit $KSFT_FAIL' INT TERM
+
+# Run a stress phase. $1: name, $2: fault attr to enable ("" for none).
+stress_phase() {
+	local name=$1 fa=$2 base after injected
+
+	if [ -n "$fa" ] && [ ! -d "$(fa_dir "$fa")" ]; then
+		echo "SKIP: $name (no $(fa_dir "$fa"))"
+		return
+	fi
+
+	log "phase $name: ${duration}s"
+	base=$(memmap_total)
+	[ -n "$fa" ] && fa_enable "$fa"
+	start_workers
+	sleep "$duration"
+	stop_workers
+	if [ -n "$fa" ]; then
+		injected=$(fa_disable "$fa")
+		log "$name: injected $injected failures"
+		[ "$injected" -gt 0 ] ||
+			log "WARNING: $name: no failures injected"
+	fi
+
+	drain || return
+	after=$(memmap_total)
+	if [ "$after" -ne "$base" ]; then
+		fail "$name: memmap pages $after after drain, expected $base"
+	else
+		pass "$name"
+	fi
+}
+
+accounting_phase() {
+	local base got added after expect
+
+	log "phase accounting"
+	base=$(memmap_total)
+	got=$(set_nr "$target_nr")
+	added=$(( got - orig_nr ))
+	if [ "$added" -le 0 ]; then
+		fail "accounting: could not allocate any ${size_kb}kB hugepages"
+		return
+	fi
+	[ "$added" -eq "$nr" ] || log "accounting: only allocated $added of $nr"
+
+	after=$(memmap_total)
+	expect=$(( base - added * freed_per_folio ))
+	if [ "$after" -ne "$expect" ]; then
+		fail "accounting: memmap pages $after after optimizing" \
+			"$added folios, expected $expect (baseline $base)"
+	else
+		pass "accounting: optimize freed $(( base - after ))" \
+			"vmemmap pages"
+	fi
+
+	drain || return
+	after=$(memmap_total)
+	if [ "$after" -ne "$base" ]; then
+		fail "accounting: memmap pages $after after restore," \
+			"expected $base"
+	else
+		pass "accounting: restore"
+	fi
+}
+
+echo "$marker" > /dev/kmsg
+
+accounting_phase
+stress_phase stress ""
+stress_phase pte-inject fail_hugetlb_vmemmap_pte
+
+check_dmesg
+
+if [ "$failures" -ne 0 ]; then
+	echo "FAILED: $failures check(s)"
+	exit $KSFT_FAIL
+fi
+echo "OK"
+exit $KSFT_PASS
diff --git a/tools/testing/selftests/mm/ksft_hugetlb_vmemmap.sh b/tools/testing/selftests/mm/ksft_hugetlb_vmemmap.sh
new file mode 100755
index 000000000000..905b75b2cfb4
--- /dev/null
+++ b/tools/testing/selftests/mm/ksft_hugetlb_vmemmap.sh
@@ -0,0 +1,4 @@
+#!/bin/sh -e
+# SPDX-License-Identifier: GPL-2.0
+
+./run_vmtests.sh -t hugetlb_vmemmap
diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index 973cb715b326..f439affe5d70 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -79,6 +79,8 @@ separated by spaces:
 	test transparent huge pages
 - hugetlb
 	test hugetlbfs huge pages
+- hugetlb_vmemmap
+	test the hugetlb vmemmap optimization
 - migration
 	invoke move_pages(2) to exercise the migration entry code
 	paths in the kernel
@@ -327,6 +329,8 @@ echo "$enable_soft_offline" > /proc/sys/vm/enable_soft_offline
 CATEGORY="hugetlb" run_test ./hugetlb-read-hwpoison
 fi
 
+CATEGORY="hugetlb_vmemmap" run_test ./hugetlb_vmemmap_stress.sh
+
 if [ $VADDR64 -ne 0 ]; then
 	# va high address boundary switch test
 	CATEGORY="hugevm" run_test bash ./va_high_addr_switch.sh
-- 
2.56.1.809.ga0b61035b5-goog


