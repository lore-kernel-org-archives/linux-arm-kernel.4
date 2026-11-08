Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4D5606A334
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 22:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dgFC+o9Y;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AAK7GNWv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Content-Transfer-Encoding
	:Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=HcvDsXa3O+G39UdiEfyimjtY92NVtPxyg63btC5A0Po=; b=dgFC+o9YC9GgUUOXRkghgvJytK
	TABemQ8sOiWjGZLjUo55DsMNNCvURujIu0R8VlgkyW9MY4on8h6uXcAFNtNoGHz4l2pgOOY+xkHlC
	YvgAAy+NxmO8zjE3602pjau0DbWgR971wQ/ySgcfpXeLsLH4Bi1+hHy8uCKeOtFtJ690D94699sJX
	Gh/JrejKGT8TF76XMtnd6oUfTGn7EM1w3rbeqApOP0fX5izLkOjMWU4/isVziSaqewHGman+5+kng
	vUvgPAdk2XYiQKcWmiPRShyjH1gA2PscNTJ00vnHNa1PV/1MZkk7jdzbSBAt4N6dF7jIxCeeAzU6p
	Xjeow68w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBNE-0000000GoLt-1zoj;
	Sun, 08 Nov 2026 22:28:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBNE-0000000GoLn-0IcY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 22:28:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C804941FEB;
	Sun,  8 Nov 2026 22:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2534B1F0089F;
	Sun,  8 Nov 2026 22:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794176907;
	bh=HcvDsXa3O+G39UdiEfyimjtY92NVtPxyg63btC5A0Po=;
	h=From:Subject:Date:To;
	b=AAK7GNWvnp/KvgO+LDatd5tAO65AhGYPqobUytIcPagMw1+adi6kXa1jDQBBBRvkW
	 LusGlabNSRAkWqg+QpOk+SgQ5VaYch2RU18nqoL3+QmVT+vHYp1lyWYoZWpp/M0sD2
	 ZzqRclNpKimHvvVA8mcwEJtv5kTqS2G43D4wDoqCNG1kjYDIA+Iv0EvTF8BwzJyEY1
	 JCMjcG7ARmDsLtfUY7C5/s379tHya79ACb2BKDQbkvHyTZ7f6+fUuPJklGtESfhDaE
	 LDDrjwaWsa/Fw9+ZR0GKEntJsI5qrZUDhXnFK0PMDWjRc1gvIrY+BXhPaty3s9A5jv
	 3VFLpp77RzjuA==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH 0/4] ARM: gemini: Update defconfig
Date: Sun, 08 Nov 2026 23:28:23 +0100
Message-Id: <20261108-b4-gemini-defconfig-update-v1-0-59a3ca5d8e55@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MQQrCMBAF0KsMf92BpESjuYq4qJ1JnIVpSaoIp
 XcXfAd4O7o2045EO5p+rNtSkcgPhPk51aJsgkQY3Xj23l34Ebjoy6qxaJ6Xmq3we5VpU5bTVV2
 IOUYJGAhr02zff367H8cPNrgabGwAAAA=
X-Change-ID: 20261108-b4-gemini-defconfig-update-d59e047f77d4
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

Refresh gemini_defconfig for v7.4-rc1, enable DMA CMA for display buffers
and ext4 filesystems, and update USB support. Drop UHCI and enable
DNS-313 USB gadget support with the configfs serial function.

Prepared with Codex using Kconfig to regenerate the configuration.
Codex also prepared the commit messages.

---
Linus Walleij (4):
      ARM: gemini: Refresh defconfig
      ARM: gemini: Enable DMA CMA for display buffers
      ARM: gemini: Enable ext4 filesystem support
      ARM: gemini: Update USB support

 arch/arm/configs/gemini_defconfig | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-b4-gemini-defconfig-update-d59e047f77d4

Best regards,
--  
Linus Walleij <linusw@kernel.org>


