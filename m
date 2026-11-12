Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010AC606A338
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QHDbYaET;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=SPX8SBgi;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=tfn/FbN5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=T4wvbmlGavsD3z/Wsa8ilvVNxdIe/3j7rJGAW5GvJHM=; b=QHDbYaETFnDCcA
	wVetbsum0MwZzvPLGWuyxy5QxNN1KeEhAhaX+gTIsVjsZheSGGUTjGFUHMECgCP7eQ4wMHy/VDlSc
	mIPopPGlOWW2Scx+yo/79/49bAH63DBGCXBajBaZ1H5jRtTrAksTCWqrX5Dqi3vH+cxWWkgbs7qiH
	ATimhHXOEjvvLnvLLBWoYhm10BidxrFMxc8OEhCuRVStEZqiVM4SdX1XDKzEOfv1PFpUk42CWvC2A
	Rg1jGtbHnc5fyYHedmFhx6ytvLD6vbM9m7t++2g8rW+K4MlQmtdP5PE9TF3B4/3iD8P/+qmyS2/nQ
	l4dWv9dNqFQrm25ag73A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUlt-0000000A1uS-2nO8;
	Thu, 12 Nov 2026 13:23:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUlC-0000000A1DG-2bOU
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Nov 2026 13:22:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=T4wvbmlGavsD3z/Wsa8ilvVNxdIe/3j7rJGAW5GvJHM=; b=SPX8SBgivODiZAwuYEoklDREX1
	mhZumo1LqLPGkOoKKpfMAWXmrvqIzZPbzr+/6INDNe7PcxTJxGTebDLH1sL7FiOJ0F8CdHKI6UovW
	bqtIXhuyUaJRB90w2jqZe6Oh/cG4xukyIhbO11eOLq+ZhJ6VpqSHWvGPF9IrX16F2HMY/zNpReQ0X
	rgWyJSliDMBBgsuIUjBQNwvYQiRKIR6xRoSzsAn7sgxJY/Y54IVjege7xLoNo7Iuok0npi4cfy0AZ
	Ks5zNsawoXd0MyNuZgWjhpypAb3joq0hb6WSGfuY0j0eQY8dLUatDRqMl5zcaxBO1lufbCV6iZtfu
	LLbJwDLg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUl9-0000000AMn0-0bLh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:22:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39372165C;
	Thu, 12 Nov 2026 05:22:31 -0800 (PST)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E48883F632;
	Thu, 12 Nov 2026 05:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489754; bh=zEkMpmy8LfL07tt5sMa1cZYFDNgpnAUVtM05OxCb1Fc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tfn/FbN5LI+7s6gTUY2OG9GGrda0kfj4IkKG8zt6t8joDXxfz/SKTjkA2+u4jEHqe
	 5eijweOf4IWfXLUbLYS3EddpGRxqeYDPwOyLoU9QQmnhAvDwVZtI58WkPqQvjEgBPb
	 fw1UJAiuwYQoPp6Wa8VCZUR32IUeuh0u6uuVHeM8=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	lpieralisi@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com,
	ashok.raj@oss.qualcomm.com,
	maz@kernel.org
Subject: [PATCH v2 28/39] arm64/efi: Add ALLINT to IRQ flags checks
Date: Thu, 12 Nov 2026 13:20:31 +0000
Message-Id: <20261112132042.129062-29-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20261112132042.129062-1-vladimir.murzin@arm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_132235_169838_0507005B 
X-CRM114-Status: UNSURE (   8.76  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.5 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

EFI is not expected to modify PSTATE.ALLINT, so check that it remains
unchanged across EFI runtime calls.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/efi.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/include/asm/efi.h b/arch/arm64/include/asm/efi.h
index 0fc5a8cd5850..c7fb21c00690 100644
--- a/arch/arm64/include/asm/efi.h
+++ b/arch/arm64/include/asm/efi.h
@@ -78,6 +78,10 @@ do {															\
 		pr_err_ratelimited(FW_BUG "DAIF+PMR corrupted (0x%x + 0x%x=>0x%x + 0x%x) by EFI call from %pS\n",	\
 				   __expected.daif, __expected.pmr, __actual.daif, __actual.pmr,			\
 				   caller ?: __builtin_return_address(0));						\
+	} else if (system_uses_nmi()) {											\
+		pr_err_ratelimited(FW_BUG "DAIF+ALLINT corrupted (0x%x + 0x%x=>0x%x + 0x%x) by EFI call from %pS\n",	\
+				   __expected.daif, __expected.allint, __actual.daif, __actual.allint,			\
+				   caller ?: __builtin_return_address(0));						\
 	} else {													\
 		pr_err_ratelimited(FW_BUG "DAIF corrupted (0x%x=>0x%x) by EFI call from %pS\n",				\
 				   __expected.daif, __actual.daif,							\
-- 
2.34.1


