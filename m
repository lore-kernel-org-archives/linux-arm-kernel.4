Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F71606A882
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lX0vARW3;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=aunbdKLa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CneFnAjFutRrGEcU3jb+M5OY+ibrOp6RyZtxs6jTIGg=; b=lX0vARW36KXbi+
	LYI9jx4b6XuJSQMtI/xEGREQ7/tT7EFPg9cHcvcxAyQPxPXGoIhFY4T+um5hyLjt+/kOSw7zf5/vr
	0YCj3AVl4kBM82ESul9Llhe61qh0mzZ9MANHKil5WT/0TNbcVdh37bL0yReJeiflW7+qVpZasPRaN
	yO3fHyOeKW50zxeClnO/5j0Ws1QFHzsp6Wk3g52NjS9C2yvZ/4tmMN9l828MTQM4MMP3EHAO0bPfl
	OWdHjLwK6mQvBInSsf1tgjs9GFDn6Tq+bhbTHQs2MSJogefyEFmlwsFHSQMuyr/BapWj1zvOtasWV
	ipbI8IEEetYLCxPEN/aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4qp-0000000FK5j-3Yip;
	Sat, 14 Nov 2026 03:54:51 +0000
Received: from mail-pj1-x1062.google.com ([2607:f8b0:4864:20::1062])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4qm-0000000FK52-3DE6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:54:50 +0000
Received: by mail-pj1-x1062.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so928925a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:54:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794628488; x=1795233288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CneFnAjFutRrGEcU3jb+M5OY+ibrOp6RyZtxs6jTIGg=;
        b=gUVlMXxh4jnApO1TbB7+IsB1K6ZyPmSYMdoXMwq3IAo4p9LbwdZoA/2Gbqg8AhMero
         ZBe2VTmAx+CYYj0mJahULveNOdIN5S2hRE4AVs5u7qVXpYvF9iv6udUutdNEQUSz9UHd
         roAbCmWxlg7X3Sp30a9+dJ0j+mPovbwDd2YDTyFM1YEPDh29G3Kqr9xUFbReuDnRsqxw
         W+mmqYoZTnb6z2HZ4nL53w84obro9z82p0s5tlD/AIBcoHzlCO+loeoY1lw0sQXllMvY
         JYUa0mtCMXVktmySh5vbLEuSoO7OgU5k95CoIEBI/zOrCO2ypHN9TJw5iYz0s76jv40z
         JCGQ==
X-Forwarded-Encrypted: i=1; AL+hErFS++NwmC75avlk7solqbbyI31mf6dRrSYou4CMSO0ZEs1hicjEpB2ezx4ZladLfrKAx2Gwst8yLYONCbkECg9j@lists.infradead.org
X-Gm-Message-State: APuU4Z8CKpWfuhaWidB0x0AXDkClCqTzc3W6BZcGIsCZ3iTceAyGHLr3
	UaDomsjim5qJU2VAXFjG0qyqKJTM/XTlvJ1PoGqcviqirqfVhRQwCk+uGsepAvXkgqX0GAMSxhI
	Lg121mEXcELceOJTj9nRxDdOQkiWRk184VoMMk/qItWQdLV+hT3tqQL6qi3cKOrkFEkA/AOjTw1
	FQmoCnvpR1o7yLVuU+fnxHTRNEv8zAWao3M/mvEYeLxTgPE7nNB/aJZQMZ+vASiUSDSsYSlWGlf
	DVIxhFVwjPuWuG/QvNHWwK0IPiShodvs98=
X-Gm-Gg: AYBFou0b97VIr+vM0FsXo49LQ8+7qJIlmMHMe0Liwd0weTjO0AuVfBPA+0oYPQUhfOa
	800wBL6JisXnaP7AZc8Ab0qnWnkKuhxNwP5hkPK97oOCnh1RBQbzO2mPvLLS0Zyc2aHDhzwve+J
	bn/2qYo7mdEkCetAxi0pHe/C8dlGFCRCBI6hXp4tzUALEXhO/7zSUSzFuute1x5h/TtIjpCfJFf
	CfmDJc/vrp/gQXqfQL3IXo0ARpaOYqYPLV8UBdhQyuvUpNPUn7T5S/4x4eC4U4DcB8PXqKzcdY2
	mx0mX9dNl7PR9lzWB8/8WG1eYcgvDcxaIxpBjp3q8SNSYAprbSejAyfy4ub/IHZr82mZMU/zHV/
	pgqi182Us6XGtsp2HgjpUU5U3bCQhUevA/bbOQM4OxfrSyh5N1f7OwzyBUlYUBiEzImtFBthnzp
	CeKS6TrZ3oNmPj8clirmAfoCB8vsjwaMGLa+TNg2T+
X-Received: by 2002:a17:90b:5112:b0:3ac:9ad9:6afe with SMTP id 98e67ed59e1d1-3b1b0d481c5mr2902589a91.39.1794628487787;
        Fri, 13 Nov 2026 19:54:47 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b1ed0b73sm3161382a91.0.2026.11.13.19.54.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:54:47 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3724667bc16so1012872eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794628486; x=1795233286; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CneFnAjFutRrGEcU3jb+M5OY+ibrOp6RyZtxs6jTIGg=;
        b=aunbdKLaVfkbR51FhW18YriuvSycyRyQjuip2PdYElWo5zv7M4z0HhLbIyiJx7tZQE
         7rSvTKrOcz6OEWhrT8f0+l/H2dUgrKS33PcGiQ4t6Elnn4a0zanfQKt+M1Xt6pEZN2O8
         RuYsjMQf8G/0BDVyQSWAW9DEfOzvoQLXxLPeY=
X-Forwarded-Encrypted: i=1; AL+hErEBUmYfXEg/iPaGRscN8nfWpVGXR7x4gz0eNWSws4mcteteVlPj+Au8FTvAF4Hi3Th+KVfmPrmuythAhKQf1xN7@lists.infradead.org
X-Received: by 2002:a05:7300:7fa6:b0:36d:38e0:79f3 with SMTP id 5a478bee46e88-377e1af812emr9727037eec.25.1794628485897;
        Fri, 13 Nov 2026 19:54:45 -0800 (PST)
X-Received: by 2002:a05:7300:7fa6:b0:36d:38e0:79f3 with SMTP id 5a478bee46e88-377e1af812emr9727004eec.25.1794628485231;
        Fri, 13 Nov 2026 19:54:45 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm12842438eec.14.2026.11.13.19.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:54:44 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Rosen Penev <rosenp@gmail.com>,
	devicetree@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	"moderated list:BROADCOM IPROC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: alamo: use qca8337 internal PHYs
Date: Fri, 13 Nov 2026 19:54:43 -0800
Message-ID: <20261114035443.879552-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923183912.13389-1-rosenp@gmail.com>
References: <20260923183912.13389-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_195448_807568_ACA39E6C 
X-CRM114-Status: GOOD (  10.62  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Florian Fainelli <f.fainelli@gmail.com>

On Wed, 23 Sep 2026 11:39:12 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> The QCA8337 switch has a managed internal MDIO bus for its built-in
> PHYs.  Move the PHY nodes from the external mdio@0 bus into a
> subnode of the switch, and mark the connected switch ports with
> phy-mode = "internal", so the ports are linked to the correct PHYs.
> 
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

