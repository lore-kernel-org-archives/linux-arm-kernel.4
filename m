Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069E3606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 11:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mCLdur+f;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Kcbwldaz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vb+EIciprrYd/5g/UVRrx/Fk4f8HJXZeOfqJKIISy7E=; b=mCLdur+fjzFqBB
	PpY8JPQtCgNWUBvtousCJbW2bGOxtsESRoZq0lJB8eKnAniV50JxCiNdMfSwLM8zTv2XC6M9MtuJf
	SbE1qcr3cuchkg9Tyy0FaZE3sRK9RGGB9XKEYP2m0qSNUbXYOyCAJMEk9984dYu8T112g+iDGl9rp
	ku0VXT8uq+Zpb2V/BDFMvvv+VtQ6tMVWrquAwkhtfkljpTlCSz+CSBWPpD7Y7Re/PEXOzUF+6LLnr
	4pJ0KQ4JMilasbQVfQuirXFKogui5VT+JOz4zO/v83Sh/mXl/OOTXA03QjYA1VPjx7Tm4+rISagbS
	idibOY1gx7SnhpfDL1Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSBI-00000003ARO-32Bw;
	Mon, 23 Nov 2026 11:25:56 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSB7-00000003AMW-2jJX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:25:48 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id BDE3E2020E2;
	Mon, 23 Nov 2026 12:25:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795433142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vb+EIciprrYd/5g/UVRrx/Fk4f8HJXZeOfqJKIISy7E=;
	b=Kcbwldazoug/OEH9qzqxE23OE/hpd7ZMSTBczCp7ZqjVA+aLlboiWgIr24ZmgRoHIi6lsx
	2tngYanTqlFEuJ6BCtqESGcL300b1srcjJtOeNH2S+zpEX6fa48bO9lKo7POy8ofzzx8GB
	x6eQCRzcjOeZxpMuTMRCWtX91+dy9Yy6m6xYjYutGJR3B2HFiCrsOd8manfFBN+7mBeTac
	k8uLN0aGinjJ0zzRPY3wvYudXD2avRztNG4wbhoawInNBm+EAOqZ7cGGC176LUYXTrZYs8
	S1TluG16DVLaHF/bDqyey+zTgqopTY8zTkfQHte6afUAC7CvQxCUTNeyYrRDQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795433142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vb+EIciprrYd/5g/UVRrx/Fk4f8HJXZeOfqJKIISy7E=;
	b=ZnHVuBY2LXNoH7oAykr6PpYW8fpYm/Wjb8VRlh2LxZFTrEEkHAxpvEOqw+CzDtpgGNcyad
	CTo4JDo/1shhRRwgAeFXb57uvkQ14h0Oh4qIv2r8dN8GmjuUjs+R1UvQyJLA3CifhKY2QE
	RtrYqWOZSbnwX7a2UC84D2qzBDMWFbgVm6en2ucfn0jEgi7u/KgleWsZtisynwdGnOMEjH
	jhCvVZX990W7fxNeLIIPFzYrjqtOry6S8ZZo5tGEA9jBNZNzwH+5nK9E+DmUnbfC/hWHhS
	I3Cg4spqe0QGir36LlkAEl9QkQ8M/VjcWrb1BOla/aO6JUUhbZWhAwWPZE0gfA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795433142; a=rsa-sha256;
	cv=none;
	b=OPxuAL/dPMmlWns16nGx2Ai1y6mNba6rldF/0KPzv2N+PcZ1kXpI8iIMscfAyumfcPvoqP
	9QzyM+d0H1vIJi/+CNf0WJSWxEIseFW2pvNU325cDgwrvjj/z6ngrOxwYY+do8F2VNhT6G
	16kEooZ3SkbdDCR+zbi3GiW9kG9FBGbh9XFGiwSFsHWI6fRot0gDFAThSODNckSkklgNEg
	ACuDCipoT4IGCHwtLRTLGmrSLPNDO04tQIS2NSBMgPJ3nXYIeO+LKcFYZIe3xaWyurDw6e
	JwF9fCqQTGS16Us44nye1JyyeEvEPOPNLLKl29Bne1wtG03N47FK+jpCA81GZg==
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.2])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <f.diener@pengutronix.de>)
	id 1xVSB4-0016XI-0a;
	Mon, 23 Nov 2026 12:25:42 +0100
From: Freimut Diener <f.diener@pengutronix.de>
Date: Mon, 23 Nov 2026 12:25:18 +0100
Subject: [PATCH v2 4/5] arm64: dts: freescale: imx91-93-common: Add EL2
 virtual timer interrupt
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-imx93-frdm-fixes-v2-4-dd97c7fca4b1@pengutronix.de>
References: <20261123-imx93-frdm-fixes-v2-0-dd97c7fca4b1@pengutronix.de>
In-Reply-To: <20261123-imx93-frdm-fixes-v2-0-dd97c7fca4b1@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Freimut Diener <f.diener@pengutronix.de>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_032546_389416_883A20A7 
X-CRM114-Status: GOOD (  11.47  )
X-Spam-Score: -2.1 (--)
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

The Cortex-A55 CPUs in the i.MX91 and i.MX93 SoCs support Virtual Host
Extensions (VHE). When running at EL2 with VHE enabled, Linux prefers
the EL2 virtual timer over the EL2 physical timer.

The timer node in imx91_93_common.dtsi only describes four architected
timer interrupts, omitting the EL2 virtual timer interrupt. As a result,
Linux reports:

    [Firmware Bug]: VHE-capable CPU without EL2 virtual timer interrupt

and falls back to the EL2 physical timer.

Add the missing EL2 virtual timer interrupt (PPI 12) to allow Linux to
use the EL2 virtual timer.

Tested on an NXP FRDM-i.MX93 board. Linux selects the EL2 virtual
timer (hyp-virt), and interrupt counts increase on both CPUs. Timer
operation was also verified across CPU idle transitions.

Signed-off-by: Freimut Diener <f.diener@pengutronix.de>

---
While this change fixes a real bug for me, this same change was already
previously proposed by Marc Zyngier <maz@kernel.org> in May as part of a
larger series.

Link: https://lore.kernel.org/all/20260523140242.586031-10-maz@kernel.org/
---
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
index a68ffd04ee084..af4c93c128d31 100644
--- a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
@@ -82,7 +82,8 @@ timer {
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
 		clock-frequency = <24000000>;
 		arm,no-tick-in-suspend;
 		interrupt-parent = <&gic>;

-- 
2.56.0


