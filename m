Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61DE606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 00:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VmheO2r5;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HRXGlQyF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Yjf1nlid2RxibMkFZUC9F480BQC7qNJljbiK4xF8UDk=; b=VmheO2r5AZWGUg
	1ZnjNgDccopto2ZhtvngAnjqFiowAUOsx/D+mBFaY9IIR9agRzz3mo7F2PNdQiTRg8DkF9771B/B6
	tTmgdGCxKlTWGP6R2dPsHEkukO0H/cyalpKYjALu/UqUwT31xLHrhjyDzQCahJvCG+jIim8a9xjAr
	efLY5aOunCdA0NefxhhVXlzctqBS01kBk2do4IAZ1yM06L6hFAcEqzU5j6bGVgc7IFRFgczFh15Wc
	F/wA2jvoMfU6S5GrJXdMpu4Vb99lbhHmLGlOWqlG4weBF1V/e5YVYk3/lTQPldJP3jKo0vG2k5Xjy
	0yAzkSICwg6xLBn41Qiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNV4-0000000Bftt-1p2x;
	Thu, 26 Nov 2026 00:38:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNUW-0000000Bfc5-0Uom
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 00:37:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 842DA61D12
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 00:37:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8508B1F000F4;
	Thu, 26 Nov 2026 00:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653455;
	bh=Yjf1nlid2RxibMkFZUC9F480BQC7qNJljbiK4xF8UDk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HRXGlQyFOJIiYY6JJr/klzenYd8IG9NMhYp+IiTJbFuGn1wWrpzZk+yg+nCw/BghA
	 4LDSX5naELQt2sqC7tKRaSV3E2y0F6D26r6y1zz1yN4VE7+NAVrJoLmlSlWhgm+odm
	 O28Jk5CmbORk1PvuQn6apxwW9QUMQLf7M8NuNwSjz4GFi7Rw/UzXjnTTlwPub+MlYP
	 euFDYaI81zCcaIlzhKmhcO9Yv+VAMJ290XHNzVmVOofQnBomh+bk7FqOZEoC1N95H2
	 CM0yRfbwQk5tnsadg5rsKJgFnAesLn6wMhkG3ln1PTWRdEL5TzqDGjdy+wJ0oC0+OY
	 E6L0SMdZ/1A2Q==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:16 +0100
Subject: [PATCH 12/20] ARM: dts: ux500: Correct the PL011 functional clock
 names
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-12-791cd62d8870@kernel.org>
References: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
In-Reply-To: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The PL011 binding calls the functional clock uartclk. Use that name
for all three UARTs; the clock specifiers stay unchanged. Found with
CHECK_DTBS=1.

Fixes: 5a323fb4f759 ("ARM: ux500: Supply the UART clocks lookup to the DBX500 DT")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-dbx5x0.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
index 2682e250b23c..7bb09b45698d 100644
--- a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
+++ b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
@@ -881,7 +881,7 @@ serial0: serial@80120000 {
 			dma-names = "rx", "tx";
 
 			clocks = <&prcc_kclk 1 0>, <&prcc_pclk 1 0>;
-			clock-names = "uart", "apb_pclk";
+			clock-names = "uartclk", "apb_pclk";
 			power-domains = <&pm_domains DOMAIN_VAPE>;
 			resets = <&prcc_reset DB8500_PRCC_1 DB8500_PRCC_1_RESET_UART0>;
 
@@ -898,7 +898,7 @@ serial1: serial@80121000 {
 			dma-names = "rx", "tx";
 
 			clocks = <&prcc_kclk 1 1>, <&prcc_pclk 1 1>;
-			clock-names = "uart", "apb_pclk";
+			clock-names = "uartclk", "apb_pclk";
 			power-domains = <&pm_domains DOMAIN_VAPE>;
 			resets = <&prcc_reset DB8500_PRCC_1 DB8500_PRCC_1_RESET_UART1>;
 
@@ -915,7 +915,7 @@ serial2: serial@80007000 {
 			dma-names = "rx", "tx";
 
 			clocks = <&prcc_kclk 3 6>, <&prcc_pclk 3 6>;
-			clock-names = "uart", "apb_pclk";
+			clock-names = "uartclk", "apb_pclk";
 			power-domains = <&pm_domains DOMAIN_VAPE>;
 			resets = <&prcc_reset DB8500_PRCC_3 DB8500_PRCC_3_RESET_UART2>;
 

-- 
2.56.1


