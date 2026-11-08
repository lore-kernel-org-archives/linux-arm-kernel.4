Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1C4606A332
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 14:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oVpiL00Y;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BJMyEDqQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=TacDs2nTqrMpcBDIpEm1qHluc5ZSa4Yvd3fGHf+4+7c=; b=oVpiL00YuKbsC+vPIHQmjvMsit
	NJXcPijhZNK0i6Qn3kaSpFaJtj1Ijk4XWl/r+z2DgLkZwLqjIGqOOYeb3XeaeYH4sTzVVGTn+QxRu
	DwMJBlz5QaMHY6HuCYMKAeVHWOZjRFnmOUzw00c9huwCJq/YZ7XPhdhjCztkGCs8mvzei/dnC0RiR
	JNce0VKtUNAdTaN7uZJ6qCulLOYg2AGxqjNk0El/3F6qwOnbO00py62t8tdSnOVpVe2/MBgRERZgU
	z8YVP65PzVy7qQjukp/OR9QUt5VSn3Dmbtd0roKIOEd8rDN+P52i7I/C6A/wFXsAk9yOQQmUcLm+w
	nXBoRiZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ3zS-0000000GGnx-0mAf;
	Sun, 08 Nov 2026 14:35:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ3zQ-0000000GGnp-2zS4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 14:35:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E9E0C618C6;
	Sun,  8 Nov 2026 14:35:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794148523;
	b=ZhaACSiZQjflroDKJhnaHnD9Cpcqm6Ln6p2wm0kwlqiJKCklC/Rczdg39A3duSthb0K8
	 DjSn5pYT+wnzFHdA4ksFeHJIoT1Rgr/1N5O6x4bneF1S8zfZWHDbTlmuQToMviBBTtUHx
	 Q7lyp8+8NbpLCAsem4TJvPZ4ZTiZ+ww2Hmz17JuqmjP52rjGpP7/Ya5+X3KZ06nJ900rq
	 Tsj3BXzB0QqXTMRNH2A1qxdysZj7ciKoKyvAXHKbbe7bAAusV3207ffJE5d5EF7F/TgKY
	 tmNsjCEY7mVTfsJGTvWQCpQW7FRVOHF6dSURdkeKyQPFLeAmBOJpcRkAonSHcGuYVCQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794148523;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received;
	bh=TacDs2nTqrMpcBDIpEm1qHluc5ZSa4Yvd3fGHf+4+7c=;
	b=kRDtD6uKxzPsoy8sWnuaiSN7T2TsHvczEGz/mG+g6yzLT23/sk9qvbrkepSXMC3t68/l
	 bu+K3qo9l2TN5HUSgcWhs16DZ9z2edABK+tz+VtEklxS3/qYEupVkG/LAw9cr16XubC13
	 KBt4F9+FIvc5bpgVnWPyS8OXiC/UjNlQm0slQ1PHAXELFBgLwWLHHQ/pwy0puRbDaoY7j
	 ieph2nZ0EyvMhP2iEZJ7Jz+EnQ+bSYbWEVQAi3W943G20MaL+LYLzgvMu8xn1O1B27vsO
	 g1I7asEQNxfH8VUe3PY8857XHzi9PAYxuAqM8boeVxejOpbGYNuls7VC8TQVrmC7ErA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 277F81F0089F;
	Sun,  8 Nov 2026 14:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794148523;
	bh=TacDs2nTqrMpcBDIpEm1qHluc5ZSa4Yvd3fGHf+4+7c=;
	h=From:Date:Subject:To:Cc;
	b=BJMyEDqQEWckRuLgSb44ZmzGzlU3T2CeHfBX0BkYSFJw2NPT66UsQPHe49HE21KDp
	 6l+hcKdOO/u0nAkm1vDCc8gSTJcntGGDHljAoH6zLNZOi1ywWlWid8UFpzTgMJYpXe
	 5VU51QGsiHYhO+TN787/RjL3d4KDGkmkg0fvqgPgJI2kc0hdDLhMgDsL77U8qG3t4M
	 uNUJvdOdE7pZ4B/j5UHjnX1Nzt/2fA/lUDxShMoeApc7wqogO67w2/k6V+EVUvGECr
	 XacfcyNrEFfAnpdUHGS/Z9V91Cltv+hWwcNIsIvMqwKQrDhRmuyZgpMFJZJzn42sE8
	 4Obqd9QSetR7g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 80EA847FAD;
	Sun,  8 Nov 2026 14:35:22 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 08 Nov 2026 15:35:11 +0100
Subject: [PATCH] soc: apple: Fix swapped paddr and size shift
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-b4-sart-fix-v1-1-dab7dc1e9adb@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw5AMBCF4VeRWZtEXRrxKmLR1mAskA4iaby7Y
 vmd5PwBhDyTQJME8HSy8LpEqDQBN5llJOQ+GvIs10plNdoSxfgdB76wsn3htCrNoDXEx+Ypzl+
 t7X7LYWdy+5uA+34Aa4Yrom8AAAA=
X-Change-ID: 20261108-b4-sart-fix-5bd3c614af66
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1075; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=CxvqlaaGSLGOU+O2kAABji4s/QSx7FuuOM5btlD5e0o=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9aHjvkrhfl3h+32X7JAaIXs7deRJkvUjt4zS7FrWJy3x
 m1RWdbEjlIWBjEuBlkxRZbt++1Nnzx8I7h006X3MHNYmUCGMHBxCsBEZrky/JWcejTtg+WHhmVL
 2l3r9ayX+p+td9+0PVNc7dC9Gwnv3mkxMvwPyun98WiSwcOCdXaNDL8zr6/OVlMKcY4NsD1UY/t
 qPj8A
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
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

Right now we assign the paddr shift to the size shift and vice-versa.
Luckily, this doesn't matter because they are the same for all SART
versions but fixing this doesn't hurt.

Fixes: b170143ae111 ("soc: apple: Add SART driver")
Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/soc/apple/sart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/apple/sart.c b/drivers/soc/apple/sart.c
index 66b99955b395..5f1f9ec5d311 100644
--- a/drivers/soc/apple/sart.c
+++ b/drivers/soc/apple/sart.c
@@ -258,8 +258,8 @@ static int sart_set_entry(struct apple_sart *sart, int index, u8 flags,
 	if (paddr & ((1 << sart->ops->paddr_shift) - 1))
 		return -EINVAL;
 
-	paddr >>= sart->ops->size_shift;
-	size >>= sart->ops->paddr_shift;
+	paddr >>= sart->ops->paddr_shift;
+	size >>= sart->ops->size_shift;
 
 	if (size > sart->ops->size_max)
 		return -EINVAL;

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-b4-sart-fix-5bd3c614af66

Best regards,
--  
Sven Peter <sven@kernel.org>



