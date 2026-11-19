Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735F1606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 16:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q8yCMt5+;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JmrLOcUN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JLDwz9ycOu6YbPPABd6Tj3z/LQdgz4tnvknkVWOgRsQ=; b=Q8yCMt5+9HJALP
	J1ilRmSb97OQLwBQgRMwT4yCrJq3VJwlEAz8z7VxII1CGF9NKbZQgjLQnW2Zf+Qkcfx0VVnv2bbmP
	Sc3BKifuo3LN/T8GPWfFXFqI6D2yvF6STUlM2g283MpAE/SroTk+WTZEuMHz2G4ElbHev28dXoZk9
	7UbRL5sISxJwFPQbMpxJnv8/ZKXyeWdhBYvKetPNVL8IXE/Za1MAmrJOFd/5e1qi85tl/dJthvrdW
	hlWD1DILvkh2rf/GPf0xb4Sa/VeZ9QALJyJwbwEK9zJENQs5X/gz4CMcME/gud8vALpOxAfwBPgD7
	MU6Mhaw8eDwwJEFZo2YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4vt-0000000CciE-3XSS;
	Thu, 19 Nov 2026 16:24:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4vp-0000000Ccgs-2Xji;
	Thu, 19 Nov 2026 16:24:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5EA65466B8;
	Thu, 19 Nov 2026 16:24:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2F2F1F000D0;
	Thu, 19 Nov 2026 16:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795105457;
	bh=JLDwz9ycOu6YbPPABd6Tj3z/LQdgz4tnvknkVWOgRsQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JmrLOcUNIdhcWji9htOEaYTUTjtKET7j3eWYLNuEK0sAfR8Mwn6y14IFmALE1Tz7t
	 f8Sc8A3Ts/rcpx1jDWQ3wfbWnvlkpvBOsyl8cy7UBHfzI8+8kwjjGTVVhY6jVhHljh
	 a4JJC6eu8K0zC3RI8099ph3HFaMQZSaeEGxJ8Nbds7Uc7JhRRFvn2aGtgtXJ0cON1u
	 aVDMEAWZNdS5DKQ0kyKu/ntQy6CthDfkBsVFDkFIYrhhtMHXSdDjl4DAf7w3IO/2aC
	 27bomEi/Or9kDpyYP4OKNsYRCxRV6d8LIkkeuem9sm0lPnoVPp8P1ucSOw6qqmQZpA
	 wdxsDO8axBDVw==
From: Vinod Koul <vkoul@kernel.org>
To: neil.armstrong@linaro.org, mani@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, gary.yang@cixtech.com, 
 fugang.duan@cixtech.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Luo Liu <Luo.Liu@cixtech.com>
Cc: cix-kernel-upstream@cixtech.com, p.zabel@pengutronix.de, 
 linux-kernel@vger.kernel.org, Wuyi.Shen@cixtech.com, 
 EastLake.Yang@cixtech.com
In-Reply-To: <20261116073800.2396894-1-Luo.Liu@cixtech.com>
References: <20261116073800.2396894-1-Luo.Liu@cixtech.com>
Subject: Re: (subset) [PATCH v5 0/3] phy: cix: Add Sky1 DisplayPort PHY
Message-Id: <179510545262.1370333.17988639888921284371.b4-ty@kernel.org>
Date: Thu, 19 Nov 2026 21:54:12 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Mon, 16 Nov 2026 15:37:57 +0800, Luo Liu wrote:
> Add the CIX Sky1 dedicated DisplayPort PHY: the binding, the driver,
> and the Sky1 devicetree node.
> 
> Changes in v5:
> 
> The binding and the devicetree node are unchanged. The driver changes
> address review comments:
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: phy: Add CIX Sky1 DP PHY
      commit: 804eb94ad72b4b896fde5c629f8f1b5f06301f96
[2/3] phy: cix: Add Sky1 DP PHY driver
      commit: 1ad6145fb8536810c25f8d9ee539a83b01296635

Best regards,
-- 
~Vinod



