Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A770606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 04:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WQ7zYTPX;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OQbiLSfR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=B0l8d811xXE3dnZmwNLfCrP+2Be29E3U8oZ38NJ2ems=; b=WQ7zYTPXjxvP2bbO9SmIpIu72B
	yjzlRPrd5QbffW5XUgHRQCS+T2MgKp+Ot8eDKKcdpS0UyIT05WTSduYHUgFVQbrZMBZ/jeuhMdU17
	j1H6vuPYKzhEfHtME12wU1YkGV1y6OdFfULuQZvhI2OStiwLt6jmFaHEMhYruV8Q0op2w5hFipaw8
	7RV8VMtQfwABrd7A72IoU7Nd7tU+/ocNURz2ZnzeZsuiI+KqbHmyAzkEQMhpSgD2Nw9WJ7vbaGcgS
	ODCwoB6PX2k69MKOiToZET7vhi0NR1BLTXr94hWo27MJTWBYv5876hHbqG0y+ETN/LZRuUXy+OVgf
	26+BeO2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQGlW-0000000HIBn-1587;
	Mon, 09 Nov 2026 04:13:54 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQGlT-0000000HIBQ-3opl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 04:13:53 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-cdb2893531bso206396a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 20:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794197630; x=1794802430; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B0l8d811xXE3dnZmwNLfCrP+2Be29E3U8oZ38NJ2ems=;
        b=OQbiLSfRmVUepyKaUGnA/QnZGRUc0/C49EO1wEoEDom0UjxdWAmeIK1hEpKilIyB/T
         iYBB8loxgKNSANsTQHBGc1vYXHf2gg+YDihn+4rFDysIdhQ7u0IzxJQ4Ut4ZOOacVrur
         k8z170A7LDBwhe85Up7kgK3OsROGyk9O1vqZUvJvN9/haokZQy9pQHDiyw3+XlQwEiff
         Ngw8zpxgpmzVXGr8EklvkdLBjS7f1tQdnZmqWZeaUjBeIxsc9veecK931hAsNOYvFLIA
         aQn5c6uujVeBULwZWbA3TmYWHEdn9JkcTvLvn9zCpnCVc4fisJeboUjAoFuAZs5v9JRH
         Sj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794197630; x=1794802430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B0l8d811xXE3dnZmwNLfCrP+2Be29E3U8oZ38NJ2ems=;
        b=nkANAI0kUIoM4vjnmKZ9Zqj89+FJ7wwX7uBDrpT5od3azhCKufz8ratnTc1X+wuT2p
         86rmi3Tuij5/j9i04g5CLWK2BTy5x0Udh3Q0i9a5409kMje8TNnRSyEl0XOsjwRdhM2H
         7aJNYHi3TrUd8GnAaqdPtl70YFQpclwhOndPwICX1zyzBnKc8SgN3HeYapxoschuvUks
         OutBmRMO6VACtaA+dAvfVL+izRVddYUOzXU2v29maITGUztNn/8z4Zk2C2UBG98B5RiW
         eTmfAmX7EM3hY0/LuX44RC9pQOiRj9i7ZyIJucwLJSXQaN4SecIULTYZwye5o9NN+QZD
         29+Q==
X-Forwarded-Encrypted: i=1; AL+hErGtLlVXnG35UVr6zba2NrgaKymJvqUfygpqgvnxsmnGNXhn/nhwcwNfkwRLpSyn6tFEKWhDwT6hoy8iI6rmbwTe@lists.infradead.org
X-Gm-Message-State: APuU4Z/M89/9GmfBGmCXSf1+YpQk54gkPxho3NQ+P2Tui9Cs/rd10P2c
	Y9lxr1feXgQN67cG/onZ1MCcnQ03yX8jfAflF+V60afiuluhY1mre2NK
X-Gm-Gg: AYBFou1i1hzD15iMrt8WPWbLM6p9mpGutiXosHPybGJywlldAxNTcVsdqeUO3bf1g+h
	hYmbo0P49FBO326kfLhU6BoRZvLbOYz2EUMP4Kgw4UeDjkRZ0bgky9tXberER8ZM6xNPwLNZB5w
	hxfpoHGjDqIDwscWhfG38isHCq0c/FtwbZh3MzpmZHYouNA/UdD06EL3kIzKytoZ9eV2LYhb/7g
	aSLlRy/W8Y/xXa15j7rYcUR3LmG2SG+OGzds+bCnDu/ei6bDwdxT1JnSTzh/srdnbKwlzzL0voi
	Ag74buhYyeLjruoYpybc2SUpHfmabMMk36Ms4eJ0RxCr4rpeZEQX6mFfv4RmHdfeB4eOphXjKrL
	w80s4Kb/XMunLa2MAN3rBX042gbHbITgEa6Pc5BftIiUIwM/JFXY19ILLQ1B+6feYio/+4p+Azy
	sHWVEqe5hru/ZREchky3JT56Regx0l5xkeH5H3sE1WUWK9WmD8rKxjCkkn5N2RpgQtxHlRSgnBX
	8SN4PdL11CL63i+A41WrTXO31NMbdKFqa8mZmh78dFJwUiTvZ8VbSFsmedGTrmLghLBuYJBvX+H
	48DMNZu60QwRmK+ZFbD0Hnw8d0TnMAyZ19NtWp0OqeOmy2u/eaLp1v4if6miWdw=
X-Received: by 2002:a17:90b:2649:b0:3b0:ab34:afc8 with SMTP id 98e67ed59e1d1-3b12d3e7150mr2343254a91.20.1794197630034;
        Sun, 08 Nov 2026 20:13:50 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1305bf886sm3998200a91.7.2026.11.08.20.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 20:13:49 -0800 (PST)
From: Jinjie Ruan <ruanjinjie01@gmail.com>
To: akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	catalin.marinas@arm.com,
	graf@amazon.com,
	leitao@debian.org,
	mark.rutland@arm.com,
	mpilaniy@redhat.com,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	will@kernel.org,
	yeoreum.yun@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: ruanjinjie@huawei.com
Subject: [PATCH v9] arm64: kexec_file: Do not use CMA for images with a non-zero text_offset
Date: Mon,  9 Nov 2026 12:13:24 +0800
Message-ID: <20261109041324.3642034-1-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_201351_958668_8EE7E9E9 
X-CRM114-Status: GOOD (  16.06  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jinjie Ruan <ruanjinjie@huawei.com>

image_load() adds text_offset to kernel_segment->mem and subtracts it
from kernel_segment->memsz.  For CMA backed segments this breaks the
load path: the payload is copied to page_address(cma), which is the CMA
base, while image->start is set to the adjusted address, so kexec jumps
into the middle of the kernel.  kimage_map_segment() has the same
mismatch when a segment has been moved.

The adjusted memsz also breaks the release path: the CMA pages are
freed using segment->memsz >> PAGE_SHIFT, which is fewer than were
allocated, leaking the tail of the allocation.

Both problems are specific to CMA segments, which are accessed through
page_address(cma) and ignore segment->mem.  The normal load path uses
segment->mem, so the text_offset adjustment stays consistent there.
Keep honoring text_offset, but load such images from regular memory by
setting image->no_cma: they lose the CMA contiguous allocation, but
keep working.

Fixes: 07d24902977e ("kexec: enable CMA based contiguous allocation")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/all/20260921090450.807575-2-ruanjinjie@huawei.com/
Link: https://lore.kernel.org/all/20260921090450.807575-3-ruanjinjie@huawei.com/
Link: https://lore.kernel.org/all/au4JOjnQlx2aSpiE@arm.com/
---
v8 -> v9:
- Fix with no_cma as Catalin suggested.
- Link to v8: https://lore.kernel.org/all/20261105125442.2282987-1-ruanjinjie@huawei.com/
v7 -> v8:
- Split out from the patch set.
- Link to v7: https://lore.kernel.org/all/20261026075201.699550-1-ruanjinjie@huawei.com/
---
 arch/arm64/kernel/kexec_image.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_image.c
index 78b1f956d8d7..f4ad22447259 100644
--- a/arch/arm64/kernel/kexec_image.c
+++ b/arch/arm64/kernel/kexec_image.c
@@ -81,6 +81,13 @@ static void *image_load(struct kimage *image,
 	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
 	kbuf.memsz = le64_to_cpu(h->image_size);
 	text_offset = le64_to_cpu(h->text_offset);
+	/*
+	 * A CMA segment is loaded and mapped through page_address(cma), which
+	 * is the CMA base and cannot represent the text_offset adjustment
+	 * below.  Load images with a non-zero text_offset from normal memory.
+	 */
+	if (text_offset)
+		image->no_cma = true;
 	kbuf.buf_align = MIN_KIMG_ALIGN;
 
 	/* Adjust kernel segment with TEXT_OFFSET */
-- 
2.43.0


