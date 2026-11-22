Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EA0606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 18:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Oz4rmRFh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=UZBmiGp5;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Tzr92w0I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CO+pK6yVZkso6hm9r9Bht7g79ypAkq9rsogUtAB1SJQ=; b=Oz4rmRFhtVUqLlbOGU8A23IMsG
	tUorvFF8r+NreIvmYXKJwPkqzydAV/m6LGNW0Pe1voxhMLuTFFWHY6aa4WYSc2XkFRGihoD9svGua
	p1CX+hgJ/khffOkNT9gdPci9o6v9yAmXA8ibFCXNdt9S1SnoypdZr6xO3CPcT4DPgXsiZLIPqA1XV
	sH3U1bTqqtZtVPirOTSCJ5iXEEgSUfIRCv2Fqr/lGx31jL7AOqi1CtNHC/63majkXzPdF34t4MYK5
	YpCGPbDCxnum8HdoBVDrmi3s4QTL8ani+SkUWs1fgahklXv1yNvIAtvPkil2f1/PMhUd16p1nHZC3
	9BqKLSBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCal-00000001ZtJ-21Hy;
	Sun, 22 Nov 2026 18:47:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCZ3-00000001Yf9-0XXW
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 22 Nov 2026 18:45:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CO+pK6yVZkso6hm9r9Bht7g79ypAkq9rsogUtAB1SJQ=; b=UZBmiGp51Qgpgdr+UaJu4TGa0v
	EgmOuRl0AHU2jqZDbe0rBBRS6FoLMn9ct9TKOViQHnJ72MBbVZ8TXGz7DU8DZlUegcgH6u+debkTo
	9smUPwYprKmPUzzRuviPex/xJLOmCuSUTZRNhH+A9UAp4a7bkOmcGzfX/03E3OLKsL/0Wr9Sfp5U7
	uMjbcHTpJooRluUy2PSqdHQUImnmcePaQh18ewSeSbXcMpT1GRMD/yO0Ixc61EGpbcrhUOyfA0AHt
	5IL8x1rp4L0InDni7vToWS24ZGAoHaSufKOsazjwWPw+MIeMy4az3LLoeHhAi0ykPLPPIliqC2gJd
	AMDQhOhw==;
Received: from mail-pl1-x647.google.com ([2607:f8b0:4864:20::647])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCZ0-00000002RHM-2TkA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 18:45:24 +0000
Received: by mail-pl1-x647.google.com with SMTP id d9443c01a7336-2f053f95aadso18897245ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 10:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373120; x=1795977920; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CO+pK6yVZkso6hm9r9Bht7g79ypAkq9rsogUtAB1SJQ=;
        b=Tzr92w0IJD5gwXnx27LB8obDnKEf/wI/+jRD2C0JyGZhpXdJHVVQHfJZcN20rLPKto
         vK77K/nvUbh+I87SNGZl27J/rtPiq+zEhfh6hcC3IFkn90dPd/D37LKEp68MzsEqJSSm
         20z2PCFEhZZR2UDL3kS6vRLGyIBp4q6pcXicGGz83XC7NGu0KqyAQjviaUbA8H/qyUv3
         wdOKVOos/qTLfHJXES92yPi6npYuKOEy2cTDvazjNP48ErfU3HkLyjVJWVdt0LqM4xMZ
         PkvTwlSd3kqHxVEBKjAZLDVAAvMmlcJyaCXEfAXcDsy5HaC1CvkipKuQ39mSi/c03vIb
         i1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373120; x=1795977920;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CO+pK6yVZkso6hm9r9Bht7g79ypAkq9rsogUtAB1SJQ=;
        b=SEbX8MUfIodzkZMolIR74gv+kvejnKeTTPY728qf9oQvkgH3sjJnTdvz0rspk8ElLX
         1jWql1QjyefCSHZQW6daI7/wT4aTu5NfDac9cjKJ9FIAU9ytkggjd+jwpWINrXO0QeyU
         IdA8ShqbMvoCHVgjIjupIMd0XRqu9AcQbOWwB7YbwMKCCEH/HVjkW+QGis9Y1oho3MhT
         AjCGbbCSgnbZQpxdxhvAkxu+EvDS8AidqEqHE4b4PAa98nhJ6u62F7fvI3ASTsZEoqix
         ao7f9c9wUh10Qdo7QCFriPzX1rD/lea4gr7i9IAM5u9sOUMyFgnBpji2skJm+0a61Vh9
         YVOg==
X-Forwarded-Encrypted: i=1; AL+hErHYoZdkRkMOEraGRStspKTMjY1T4hWy/RzG7n3pvS3L3dAYGnEAwZBrendLbrEZKrTWZL3QaFIEa7nUE156AjUe@lists.infradead.org
X-Gm-Message-State: APuU4Z+W66N4rcmHtZ+E4AoHPwVzDembLoQ80HxnXHsPp4/kgem87RB7
	Z4jzME3o3rLswNuGpDC1ZjEBavpjZ5TXkz8q8MAPV+LLXe7J82jKc+2F4AdEef2VQrmKe2660Mm
	cxL2wig0/Jy2TP9ysk5dR+Q==
X-Received: from plwp12.prod.google.com ([2002:a17:903:248c:b0:2ed:8eec:6a11])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:db06:b0:2ef:efaa:17ae with SMTP id d9443c01a7336-2f03f1bacacmr79207885ad.71.1795373119804;
 Sun, 22 Nov 2026 10:45:19 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:53 +0000
In-Reply-To: <20261122184453.2668189-1-jthoughton@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261122184453.2668189-20-jthoughton@google.com>
Subject: [PATCH v3 19/19 DO-NOT-MERGE] selftests/mm: Add HVO pmd-split fault
 injection tests
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
X-CRM114-CacheID: sfid-20261122_184522_584759_1404B760 
X-CRM114-Status: GOOD (  13.19  )
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

Run the stress test with PMD splitting failure injection enabled (if
supported). Keep in mind that vmemmap PMDs are only ever split, never
collapsed back to PMDs, so run this step first, before the main stress
test.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 tools/testing/selftests/mm/hugetlb_vmemmap_stress.sh | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/hugetlb_vmemmap_stress.sh b/tools/testing/selftests/mm/hugetlb_vmemmap_stress.sh
index b64fdb3ed761..d570df02a28d 100755
--- a/tools/testing/selftests/mm/hugetlb_vmemmap_stress.sh
+++ b/tools/testing/selftests/mm/hugetlb_vmemmap_stress.sh
@@ -4,13 +4,16 @@
 # Stress test for HugeTLB vmemmap optimization (HVO).
 #
 # Phases:
-#   1. accounting: allocate N hugepages, check that nr_memmap_pages +
+#   1. pmd-inject: churn the pool with fail_hugetlb_vmemmap_pmd enabled.
+#      Runs first because vmemmap PMDs are only split once, so later phases
+#      would leave few PMD splits to fail.
+#   2. accounting: allocate N hugepages, check that nr_memmap_pages +
 #      nr_memmap_boot_pages drops by exactly N * (vmemmap pages per folio - 1),
 #      then free them and check it returns to the baseline.
-#   2. stress: churn the pool (optimize/restore) while concurrently reading
+#   3. stress: churn the pool (optimize/restore) while concurrently reading
 #      struct pages (/proc/kpageflags, /proc/kpagecount), compacting memory,
 #      and optionally reading page_owner and offlining/onlining memory.
-#   3. pte-inject: like 2, with fail_hugetlb_vmemmap_pte enabled; this hits
+#   4. pte-inject: like 2, with fail_hugetlb_vmemmap_pte enabled; this hits
 #      both the optimize rollback and the restore (partial HVO) paths.
 #
 # After each phase the pool is drained back to its original size, memmap
@@ -284,7 +287,7 @@ cleanup() {
 	local blk t
 
 	stop_workers
-	for t in fail_hugetlb_vmemmap_pte; do
+	for t in fail_hugetlb_vmemmap_pte fail_hugetlb_vmemmap_pmd; do
 		[ -d "$(fa_dir $t)" ] && fa_disable $t > /dev/null
 	done
 	if [ -f "$tmpdir/hotplug" ]; then
@@ -366,6 +369,7 @@ accounting_phase() {
 
 echo "$marker" > /dev/kmsg
 
+stress_phase pmd-inject fail_hugetlb_vmemmap_pmd
 accounting_phase
 stress_phase stress ""
 stress_phase pte-inject fail_hugetlb_vmemmap_pte
-- 
2.56.1.809.ga0b61035b5-goog


