Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A692F606A336
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 19:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Kg0WbpLj;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FG1KLOi0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HdU0c+9MCu+S9e4QMISypHwh6GOzgrr45bqF81gq1Co=; b=Kg0WbpLj+Pvmhn
	tp3SrO9MvxtQoeVR/GMmVm/KD5UZoPZZRZn9SsbqFppABhHEkTZyeqbAwWgm8hP1/uYm+2+RwHmwf
	A74roRlRlyWUtEN6AXFlsNWRdE8QDTGpIGRgkIX1uGUFjP5Ip9NDXRNSeBQY3p7YG+orAzf+XUlg0
	MqUAVGOZeEAPNHLx77nULDzoIbAGSI/Vje2L3gEm4y9L8WwPndcMDlSt2/au22H0o2dJV0evqarbQ
	SqR66RhzoZIRT05X0I4rHsj1ykI1vr0GdAyLq6XxxwPCR4iUo8FSdkE5KiK9UsTR7c0U1+Z08HpkA
	Cuv54xxCiL3QFfWlz1Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xREBd-00000007XkA-3PQO;
	Wed, 11 Nov 2026 19:40:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xREBQ-00000007XZi-11LN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 19:40:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F15F24559C;
	Wed, 11 Nov 2026 19:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C1271F00A0B;
	Wed, 11 Nov 2026 19:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794426035;
	bh=HdU0c+9MCu+S9e4QMISypHwh6GOzgrr45bqF81gq1Co=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FG1KLOi0MLv5S8xAsErfvsG+Vay1vMhZZvgKRRM1n4VgnsGQu9iwaQXQCE/2KCdxw
	 49S4CZGMt7tK1s6E7hIU4EOPHPYWGpemLbYjSd+CLib3XEvuS0YjW0I7CKb7bKGZ86
	 qkngRYjLVj6gGxQSa0MV2HLTxyaVh6+p/onin7GsFtLglKnmL8vsrB1LtbRhoUF3WH
	 fTXI7LE7pHKUtNtLZwqOhcHCKGHl4sqFFURxTcINNg6/tClCF2RvobVidtVEBHKBj9
	 jwWqCDFpfUbUq+z8D46YkWfs/e8EzvS436lJ/bmL6njikZrx3t9g04BKwI2q93zhzv
	 e6PgyJfeF4I3A==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 13:40:17 -0600
Subject: [PATCH 07/12] arm64: dts: hisilicon: hip05: Rename the HIP05 NOR
 flash node
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-dtbs-hisi-v1-7-6c9f5f80716c@kernel.org>
References: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
In-Reply-To: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guodong Xu <guodong.xu@linux.dev>, 
 Wei Xu <xuwei5@hisilicon.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev
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

Correct the HIP05 flash node name to be the documented 'flash' rather than
'nor-flash'.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/hisilicon/hip05-d02.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hip05-d02.dts b/arch/arm64/boot/dts/hisilicon/hip05-d02.dts
index b7792d443189..eecc09bd8fc9 100644
--- a/arch/arm64/boot/dts/hisilicon/hip05-d02.dts
+++ b/arch/arm64/boot/dts/hisilicon/hip05-d02.dts
@@ -54,7 +54,7 @@ &lbc {
 	ranges = <0 0 0x0 0x90000000 0x08000000>,
 		 <1 0 0x0 0x98000000 0x08000000>;
 
-	nor-flash@0 {
+	flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "numonyx,js28f00a", "cfi-flash";

-- 
2.53.0


