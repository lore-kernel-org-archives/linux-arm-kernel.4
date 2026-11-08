Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC95C606A339
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 22:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FJhRd9b9;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a05jmqI0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jYwVRSKCVm89t1XGors5AVg0TAXaRuQMENMVdIMEm60=; b=FJhRd9b9qACupR
	FO+ZZXVX/bRueOGX5lepp50C/stJoub+xGByhI7TkK97OPfsy2HP3WPL+G3PnzMLxybNgK6PzzQOF
	icAzOFMcMhcnnzhSfxwxTRSMCyGE68jMvKB+7hpJ/Mc+ULGCdiTt7P/NPVMwQJc1aJ4D2/NKCUid+
	1maNRJg7YqMv5V72si5z6LYThZhinyuM/zyC3W/NChkaC5CanKmLACgJK7nEpyBoLwXrG+XCEQa39
	zdGc+ssASKkOtTinFQ4Kasw5XJ2pm5EnGv7tXVklCv9CE6bQHF+3gXzc/S4YyeyK6OVwPvQrwNKg9
	N1+YSjHmnPMtlAWtIyzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBNH-0000000GoNF-2yFD;
	Sun, 08 Nov 2026 22:28:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBNG-0000000GoMB-1q6y
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 22:28:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 33A4840727;
	Sun,  8 Nov 2026 22:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 825531F008A7;
	Sun,  8 Nov 2026 22:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794176910;
	bh=jYwVRSKCVm89t1XGors5AVg0TAXaRuQMENMVdIMEm60=;
	h=From:Date:Subject:References:In-Reply-To:To;
	b=a05jmqI0inh/4P+5AqvIZ1Kv8iqdi2l+R31sm4Aq4nWcSxj4NKayQzJgGP8Q6/12o
	 3LgiL8jRQJ6nSJHO3St2Ny7mNsvV3aijckyIs38D1/bUbCfdLmf2+P7X6nU7IH0rVs
	 gik6cKCbVd5KJUR1ZVs8Ik97Bu1xLkFuJ1jIpui89BQGcF7VibIaHSQGjus8FGpjsR
	 4Ivl60fKfvV4M+r4+DtJqfa7tAOrulhS9wLMGoGX+WeAe/IthQeQHh3UiEe1bdtoD6
	 reU+fQNJKpaRDVTkeiufRz0U6/LkW1g/B/ZPtWc/1Kq4sKgg8YxI+wbbHSPJFuXyz/
	 h+iLkxdfN77Vg==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 08 Nov 2026 23:28:25 +0100
Subject: [PATCH 2/4] ARM: gemini: Enable DMA CMA for display buffers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-b4-gemini-defconfig-update-v1-2-59a3ca5d8e55@kernel.org>
References: <20261108-b4-gemini-defconfig-update-v1-0-59a3ca5d8e55@kernel.org>
In-Reply-To: <20261108-b4-gemini-defconfig-update-v1-0-59a3ca5d8e55@kernel.org>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enable the DMA contiguous memory allocator for the existing TVE200
GEM DMA display driver. CONFIG_CMA alone does not enable the default
DMA CMA allocation pool.

Size the pool as a percentage of RAM so that it scales across Gemini
boards with different memory sizes. Keep the default percentage of 10
instead of reserving the default fixed 16 MiB.
---
 arch/arm/configs/gemini_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/gemini_defconfig b/arch/arm/configs/gemini_defconfig
index ff69a2b57ce9..081879a90d78 100644
--- a/arch/arm/configs/gemini_defconfig
+++ b/arch/arm/configs/gemini_defconfig
@@ -100,4 +100,6 @@ CONFIG_ROMFS_FS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_CRYPTO_DEV_SL3516=y
+CONFIG_DMA_CMA=y
+CONFIG_CMA_SIZE_SEL_PERCENTAGE=y
 CONFIG_DEBUG_FS=y

-- 
2.56.0


