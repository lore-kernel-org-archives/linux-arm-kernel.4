Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62C4606A338
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S9E9HvBA;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SnoD6zoT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZlegVpC4N6/+DVa9XykpigNYuit2LZU6A1aITfV+CFo=; b=S9E9HvBAvG3E5B
	HeCNLM+rr4QfJsWFuxJrV66vzbECa6yE1f1GcUQFbAawHurkdzyMQY1hxyOV5dFPa0VV1PuS4Jmfk
	xNsnNsbXN0X8NXhVRZV59z5PjJ33h4mUzKIVjPYygiD/cx9DIrlxJW7Mi8FhX/Hg6SJLS8HqS/ttP
	LuXGRHGrUpae9FsKjiXvTgdb9iq8k0W3QYBhk3NOcxSbx2ISOr18L/7otzkkugorMqapxhXhsHyXj
	VsNYdGv0UEtTLP3m3DoR0dtHMUnuxWoL1EQlEloC1dbGGQv+pJmDeeNohQXt+QZv3Ptt0i+WlYGpd
	hykefW5OR7JijDorUdnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtcc-0000000Fi2g-0MYe;
	Fri, 27 Nov 2026 10:56:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtcb-0000000Fi2F-1AWF;
	Fri, 27 Nov 2026 10:56:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 989F060A70;
	Fri, 27 Nov 2026 10:56:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 341621F0089A;
	Fri, 27 Nov 2026 10:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795776963;
	bh=ZlegVpC4N6/+DVa9XykpigNYuit2LZU6A1aITfV+CFo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=SnoD6zoT5DtXHoebBCaOXk5dnNGkPNYHPT1HRJWuuFhbdR4XpY93ug/4Gq5M8FFrN
	 RLYY42k7RBR8m3r+XFy2JpaJ+RZ+rwdHraquLB0kt/emxtwdYX+bbxVk95X912+pwq
	 YNckXLfN6Ep6DIrJTVjZ7zch4E3C9C6REPgucdlDjskd9jxpgXGTxUoxVs9KYEVmEn
	 RQO+s5CutE/ZRQ5MnHxn/IM5IP9OyIt74hi5OupI9t5hhYIFyQIn+7huJcNjkV/iLL
	 /9I8a8cuOeHmEJ7sSOKa6uFNwOH4IHWRGg0+TZAX10nKk7ZvLfJX9/XNUTEU2+2Uwi
	 dsSzx4j6rw4xQ==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 0/2] phy: cix: add Sky1 USB/DP combo PHY support
From: Manivannan Sadhasivam <mani@kernel.org>
To: Gary Yang <gary.yang@cixtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fugang Duan <fugang.duan@cixtech.com>, 
 Luo Liu <Luo.Liu@cixtech.com>, 
 CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261117083434.3414417-1-gary.yang@cixtech.com>
References: <20261102082112.2306326-1-gary.yang@cixtech.com>
 <20261117083434.3414417-1-gary.yang@cixtech.com>
Date: Fri, 27 Nov 2026 16:25:55 +0530
Message-Id: <179577695532.3421.8058975724074009117.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1515; i=mani@kernel.org;
 h=from:subject:message-id; bh=nQgG+FcHfk3RKk15uM6aPDgBtFBZFTK+R8FuOdfx2EU=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCWG+tZ0DzfyeE6LZq3Ollpps4poHntGS6zVri
 6cieyG3DoaJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawlhvgAKCRBVnxHm/pHO
 9SCaB/0QJA8FHipnJ95yVOBHp69LW3UvgkIeZhg5eSq9UaD4QhZwPoXl9N3B88zeqm9YiQgq4ju
 YdR9S3ADS5fa0M9iLKDDdHve6YPHPiXBVQjmY+1eqq614mCKHl6m1IfhWGmpCYjfP+lRTvDP5Ct
 XuYEaR2ZPTI4bA7R5i0bjkSpwBv+46FrLFAyEBrDrqSu0r5GKquGUA+FNsMEKmbvIOApgSLLcGY
 YvZnHL3VIfmviMb+6HREGJKBwFfK9GT1W7kZb2vZTEzpIlsRsjqQcwR0vKH88/E/hmYaYWA8Kqc
 a1bhnXnj4wYnMYDugM9AwO0oHG4Y5+zt3TnW711HugfIkIHE
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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

On 2026-11-17 16:34 +0800, Gary Yang wrote:
> This series adds support for the USB/DP combo PHY of the CIX Sky1 SoC.
> Each PHY instance drives one SuperSpeedPlus USB lane and up to four
> DisplayPort lanes of a USB Type-C port. The USB and the DP controller get
> their own PHY through the PHY_TYPE_USB3 and PHY_TYPE_DP cells. Plug
> orientation and the USB/DP mode decision are taken by the Type-C connector
> driver; the PHY consumes them through the Type-C switch and mux API.
> 
> The USB and the DisplayPort controllers and the Type-C connector are not
> yet described in the CIX device trees. The graph links and the consumers
> will be added together with them.
> 
> Patch 1 adds the binding and patch 2 the driver. The SoC and board nodes
> are sent separately as a follow-up, since they go through the SoC tree.
> 
> Patch 2 builds on Luo Liu's "Add Sky1 DisplayPort PHY support" series:
> 
> https://lore.kernel.org/linux-phy/20261102030425.1957585-1-Luo.Liu@cixtech.com
> 
> That series creates drivers/phy/cix/ together with the PHY_CIX_DP Kconfig
> symbol and the CIX SKY1 DISPLAYPORT PHY DRIVER MAINTAINERS entry. This
> series adds the PHY_CIX_USBDP symbol and the new binding, and renames the
> entry to CIX SKY1 PHY DRIVERS. It should be applied on top of Luo's series
> to avoid conflicts in drivers/phy/cix/{Kconfig,Makefile} and MAINTAINERS.
> 

Please do not send new versions as a reply to the previous version. It makes it
harder to spot new revisions.

- Mani



