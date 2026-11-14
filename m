Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59387606A898
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Fbx+GD5j;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ASJKbT40
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nng5DLvgK/63+E7rI8IKFiq7cw48tw1TvpW9VBUURCA=; b=Fbx+GD5j8nQjxB
	JCHI3VzMEj4OlTYVXw9n4Fm3Sk1UEvb0OKjW5dyV8MHOWCZdnLmXgDFF4AonTvGMDFPpZbOjx1aKO
	GO0vw32dDvJW7DmMvwlICu8YgN+Px1nep1PsbJ+VmzpCN5pI0Gl314v4cn0BONOO+chT7Ah22cuMm
	cAZlq2Ah2DtTlLZ3rdopfoo/8suspTBdZXy4i2K3PMbEM9QOyVrVPHUYLEsFt5x6LCtCD79Fo7H91
	gBfS9uYoFNhcNKJsSSCEAN7EIRbaxCRt+VfWgYbMsuBFJVuRtCJgK7yhh6bU98C1NcWenY1/TInF8
	S4pwmg7x32va1A9IKWSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4UK-0000000FHNU-33pF;
	Sat, 14 Nov 2026 03:31:36 +0000
Received: from mail-pj1-x1061.google.com ([2607:f8b0:4864:20::1061])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4UH-0000000FHME-3vQ3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:31:35 +0000
Received: by mail-pj1-x1061.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so868927a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:31:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627093; x=1795231893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nng5DLvgK/63+E7rI8IKFiq7cw48tw1TvpW9VBUURCA=;
        b=pn1fCmSAbEn2Uft5iyY4KImMUwoGmsYhu0L3T4zI/1U7ZsL9EWYG7FqSuoYcYuQCjS
         +6p71uEX3NqxJeuG8eG6RkJ/kApSKNs/L9rQCiX8G2+eivPFTUmIwDKvcq/g3xYM5STa
         1UQazog3lH7vDab9TaDSvfJyet/lc4kzujQPDMVW9grV/FKQ8FrSSeCOqxmmLvKzUDdU
         RvgPMbEA0DwzalxVBG0HGcq7W3TL5ndsJLGoMO5iqTUHynhvtgZ5X96tRGKgCKdpGLDe
         CVparXU4VHgcEeO5JUQteKijNHrGBMLjrgH8RL4gylIBi1xqvN4oA41mxOsr5MntRWYv
         GvSA==
X-Forwarded-Encrypted: i=1; AL+hErFOTJE+UXCAgtfvQ/3g4RJv3cnIjNR1PE51u0c3WD+R8U2aIl3kvDE9tfdFT/CNC6713nPope1UkCysJbgmeAGp@lists.infradead.org
X-Gm-Message-State: APuU4Z+PBwaCiD+ZE5v0YA9h74RRdQmR+7ZC++kEN2N6PEtNpwoYl66d
	JXo1mmrCwGPCQvVLk219MgkNul6Cfhw4MeIZkGSonJlhnbM+0tal3ij1iJPyBQNhfd77HpdjdSE
	k1LNW+LKyAXHWrArkdGvUnSjEvukjReAu777dALX7AAc7dP883BYYltOVOt7RyuUl3bhgc8CguF
	9aufxar34eqPTzzD+po66mz5HMBq5yGn1TytVRXxgy/F9V+KHKc8IVS+6G53b7b2sKr6PL5XFM4
	2FewhfPcSUxs/06x1Qzi9A51F7fQW/TjAg=
X-Gm-Gg: AYBFou2VIRjdd+YL84U9A6hNoLChICqlUN+iWQ+Lym7vw72DndWICmo9W8MT/kmYdZy
	cqeTwKnv+mTYd/IvBOuN1nhfjj52nHhHR2n46r6Z/GzoC690ksbEasxCVU92/u/ULsGuG+JLWIg
	N9qbQ+myRbyMVFBn0A8fvgdHD5T7Vj3rXOX5HKXlqTcAk/kqcWJjjntvSCpdmUIKAU41WG2zXH2
	aGGskxZsOJ4uyNzOf1XQ2L6eD+BJYvAW9M6+9bTBWMzNIqqgHcWln+3paXpwitQquTjn2Fk3ASl
	rq0PTnA8/gei4WdIMTC57njOOitP0MtmpxRYFcfmSk771NABlNfPWVAtYc2oFDT8fWBLtlgGLR7
	2f7R26IVUVQQ9Lic6HGp8hDEQHrgC2tIfnx+ucQwM2hEOLA6TaHeLeoy06Y2PAopUkHNJtNzuEv
	50oIqFNhknXTqaIGuwqpMUexEKriNskxggEDzsP+xtuXQ=
X-Received: by 2002:a17:90b:1846:b0:3a4:6f38:f2a2 with SMTP id 98e67ed59e1d1-3b1b0a3e7bemr3824307a91.25.1794627092877;
        Fri, 13 Nov 2026 19:31:32 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1d1d744e2sm178886a91.1.2026.11.13.19.31.32
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:31:32 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ee184a2474so8626155ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794627091; x=1795231891; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nng5DLvgK/63+E7rI8IKFiq7cw48tw1TvpW9VBUURCA=;
        b=ASJKbT40gz0ygNvH9MD34akQIO7kNP954zpyrZ3d7NtRLI3pGLTU38qLU01wSvlDWn
         HPTajhdhYPOvDfl/l1QYFlhla/w5O+aUJ/Fw4kxKBfC704eN0sjHS9sjN29HGHYJ23JC
         wQv5SsU6wqjUqNJs6gXQ9dDvqYI25ODeW2TR0=
X-Forwarded-Encrypted: i=1; AL+hErGWSSB4DQkTlIzwipAeISAEsK+USTWmdee1BoX7DxqO3jBhUQ9AweXX95Ktg4S7t0ZXrxlWe/exwuhX30SyVlFP@lists.infradead.org
X-Received: by 2002:a17:90b:48c3:b0:3b0:b36b:66fc with SMTP id 98e67ed59e1d1-3b1b0cac932mr4288823a91.63.1794627090738;
        Fri, 13 Nov 2026 19:31:30 -0800 (PST)
X-Received: by 2002:a17:90b:48c3:b0:3b0:b36b:66fc with SMTP id 98e67ed59e1d1-3b1b0cac932mr4288800a91.63.1794627090341;
        Fri, 13 Nov 2026 19:31:30 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aed76745sm7343308a91.16.2026.11.13.19.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:31:28 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 4/5] arm64: dts: broadcom: bcm2712: Add reboot modes to firmware node
Date: Fri, 13 Nov 2026 19:31:27 -0800
Message-ID: <20261114033127.875742-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110-rpi-tryboot-v6-4-56f680ef4734@linutronix.de>
References: <20261110-rpi-tryboot-v6-0-56f680ef4734@linutronix.de> <20261110-rpi-tryboot-v6-4-56f680ef4734@linutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_193133_979932_017B7050 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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

On Tue, 10 Nov 2026 14:00:14 +0100, Gregor Herburger <gregor.herburger@linutronix.de> wrote:
> The Raspberry Pi firmware driver allows the tryboot reboot mode. Add
> this mode and normal boot mode to the node.
> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

