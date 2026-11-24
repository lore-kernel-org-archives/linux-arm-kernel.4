Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF2B606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 18:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lyJyuFwY;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gFIu1mqL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Kc+MsIabW6WcmNl/5p3XK4QyfJDUGsoZYSI+Sqn9zFU=; b=lyJyuFwY8NjpoD
	qEZJEII0oqPruADbsenjUjBS6NJBFgi89dwzabsB2CmtBTtrAruo5sjjUAnAuBSUVJz8HMyCrB03P
	jhZx17mWg7VW5fwoLEsV6JOu1/3xt/erWpL5ftNQBVmgxXPQdGOFMY+yL59XYRynaGSt6pmVcY8sp
	o66VHIA7AK8iaBMOsbslaGYgnCXIAswO745oO82AU/nrsuyViNXMN3ZEsuJykGNGfSVV7bhAjZxzg
	kEsYMPfu1vi7IBjA+9JuEDP8OIBWP/oxWHFe3O4L/c18GAvn/UProwLj93ovzYC3WKVdqfYz1LC5y
	lv1LfISZySERmZm/r5tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtoy-00000007Egz-36nL;
	Tue, 24 Nov 2026 16:56:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtoR-00000007EZl-2V5t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 16:56:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5AA4941139;
	Tue, 24 Nov 2026 16:56:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D44B1F000D1;
	Tue, 24 Nov 2026 16:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795539371;
	bh=Kc+MsIabW6WcmNl/5p3XK4QyfJDUGsoZYSI+Sqn9zFU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=gFIu1mqL9tR1VODH784DTiaGPaFCbwXsoXycD5emKdRiztplmbg6SJBeesiwZlydn
	 eIz3kJv4CnRq/JSUHrhe3Qn5rT0KEzTcGuv6+oJU4kIyjxPkJOM7mvDsecZlKcGjai
	 rTGPVUzpSSHoy2veLByX4mjmAWaIIGYhTQTdrMx1/zlg1SNXvQJaGC/6zVgk/a6avq
	 03aM3EjN+AbMnrV87q/3qtEWF/pzcq1g9t2+h4O2S7JFezzcSMxJCDKcICQ1tpJdtl
	 EV+s98Kcn+x1oHOOS86xOeAjDHGEWQD6XJb8J6tK/wlVU9oLXMv2gXPiJHCczGo542
	 6bTHghM6WMHQw==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jun Yan <jerrysteve1101@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20261117142122.246986-1-jerrysteve1101@gmail.com>
References: <20261117142122.246986-1-jerrysteve1101@gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: h6: taiqicat-a01: Enable
 Ethernet
Message-Id: <179553936914.1403078.2425862888304539026.b4-ty@kernel.org>
Date: Wed, 25 Nov 2026 00:56:09 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 17 Nov 2026 22:21:21 +0800, Jun Yan wrote:
> The TaiqiCat A01 has a 100 Mbit/s Ethernet port, which uses the EPHY
> integrated into the co-packaged AC200 of the Allwinner H6 SoC.
> 
> The AC200 derives its 24 MHz reference clock from PWM1, so enable the
> PWM controller and the pwm-clock node that supplies it. Also enable
> I2C3, over which the AC200 is accessed, and describe the AC200 EPHY
> package on the EMAC MDIO bus, with the EMAC operating in RMII mode.
> 
> [...]

Applied to sunxi/dt-for-7.5 in sunxi, thanks!

[1/1] arm64: dts: allwinner: h6: taiqicat-a01: Enable Ethernet
      https://git.kernel.org/sunxi/linux/c/caf2ffc9985a

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


