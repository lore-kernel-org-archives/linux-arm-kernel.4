Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FD1606A89E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2sFuXoUF;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=clF4PLnl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=B8p82c6gfTH6JQbxZJ+gox4JLLeRYECRqGwM5/HtEvo=; b=2sFuXoUF/5b+pJ
	VipXdgqjk9ChjVw9mh4cMOHUi3PM7g2lczF5o7x5SVczwO4peUlJlObcDCxd82wk8DT+wIRC5UJ7N
	r+rQ2oQtV9p9yHO1GOeEZGK25xyEQmY0o/ck4/pIqCDWzaYMxyWCKrSZeRuYfzKtCOy9oLgGcTYOI
	ql4A4vZJidtnRMDc19wjYXreN6igBDmHoq7mxYqXWcFLlVyvzuZb8/BkWHMH/XedCWeMnwONyuFST
	+MNhTTLjTohO4FdjB0qMVOVmGDy+q/BePDwEEUXYv9mmxuAeU2UCRgEafU+eE51Ke+z8MHtuocIhD
	OHje0bTyn8epSrBW40aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4E8-0000000FDiE-1lDw;
	Sat, 14 Nov 2026 03:14:52 +0000
Received: from mail-ua1-x963.google.com ([2607:f8b0:4864:20::963])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4E5-0000000FDgI-2pY4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:14:51 +0000
Received: by mail-ua1-x963.google.com with SMTP id a1e0cc1a2514c-98fea7e52b7so1721395241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:14:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626088; x=1795230888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B8p82c6gfTH6JQbxZJ+gox4JLLeRYECRqGwM5/HtEvo=;
        b=ryg8ULPBZNqHZI3Jp5VMdjxAcgsyNetYesjyBYY8UW29itO2r6zW3Rmr9mEC3Nxeye
         1koX3uSg75rAT9IsWwS/SmYzkKdOAEagSAinMTr7c5Oz89iKXeqSJN1XBV3gBpbWsiQR
         +1IGor2SPI3U5nbBCSHY/PBYzGRJcFwMOZ44HaCbsSBgEA1eylbkt4B0Oea2Z0fmoxc7
         38LXY7xS61aixy1n6rkbCjX+ga1YC0aBtRhzP/8FhJ/5xreucHEzWoS63Ruobdq6XOJV
         ZG8GAz3BgRK+/8YjiADsrgYchMTypeXFIlHbiRq/WPNP9Wa0MiCAJTMQqR3LiGZyu/oe
         oYsg==
X-Forwarded-Encrypted: i=1; AL+hErFDEa7KOeBrtjpnltpqtlONUW/gsaWpVkv8mDrChsH6FliOf+CQyBUIP03Y/c5ItRkoYE9xTk7cSrqHlgDT6j1y@lists.infradead.org
X-Gm-Message-State: APuU4Z9JWItjrgFTdWGmsq32n7dWMmdBrud7Vshu2iTSlrbOjeCo06dj
	PXfvt79aP+Oi1VxKWNXNTs5qUuQW8n0S2PwUdkzm5Wc1JtGFHeyK8Fk/CZl6Fmx3gPXNX+l4yl5
	TsezN9PuNv+GFdGbY02PZHiL7hlHlb/tFVWLfY3eff9+pWKulvweHAyFvJ7Naza0wAM70eXdouL
	uoSqemvuK4lKtSd5vrWIokBcazz5koqHX+rudKQYqBmb6pjSOzD/7K8iyVa5foulNoRGHdPs72F
	iLnZ6MEoJgRkduTVPe/gW+Fz6u+iBwIvUo=
X-Gm-Gg: AYBFou2xsqFMT1MmIiRxGKJliO4JxqDJW72p4ZntfuPE+4KvzlGWa9MafW75v5La3Dh
	+D4bkhUnNKCVhCWk2egW9HkttviSxNtcXv1w5TOUrzipSPslyG/TtOczTpgFDl2Q1saNM3vI6Z5
	D8/VTQPtfOFD5GCfL+zExUg1oW2NSq/PmCcxOh8xuAB9BnLRWjgKOFX4jZP+dWp1yPMHYDBo5mL
	AFr/dc9PPe1IIzyEWLkUUAC4zNyT7eWTx4qd18k2TC09KyjWD0lGUnsqmPJoH+9LHeA2ePO594u
	g8+liZZhFVneLo4ks5iQq/tQZP+H9wkBxXiUz9Urmmu9qrC7S4Jsx9GJ4GK0KfwotA/133WlTO4
	0Fk1rLXaKp/e3JBTn4WZZhls1G6oMmV1navvv+s+75OQPKmaC8WK03P6w2IKrFA8jCvzH1TOtkI
	nA+6//LnoX1YtEtyT5oyNSTPxtPXI0Pf5aTnfFBYFm
X-Received: by 2002:a05:6102:6050:b0:7cc:1967:5e3a with SMTP id ada2fe7eead31-7d64d82baf1mr1532464137.32.1794626088339;
        Fri, 13 Nov 2026 19:14:48 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99c842b3378sm610675241.5.2026.11.13.19.14.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:14:48 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55c5caceee8so6092771cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626087; x=1795230887; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B8p82c6gfTH6JQbxZJ+gox4JLLeRYECRqGwM5/HtEvo=;
        b=clF4PLnlNp4I+s2HDRfCOSNXK0Qv/e0aBGZfCkBi1aG7YcyvtraOjltD6WDsBzdxqQ
         793dNweGWua4vOEM0ePq2xiyYVZOJtewmN6QtU125xOodAseQougQF6f3RlGW/YqVbBi
         386XVcFHKCV23hPy1YQjBxFYfe0KDWH/NfS0g=
X-Forwarded-Encrypted: i=1; AL+hErFQ5GST2NiArjSyLJ4AeKUTh3kj6JZ5rSYOn/tp6ps5qZ9B1tKm7b6vzl+YjaORNF6XXnnDOkxunGElJ2VUgjx3@lists.infradead.org
X-Received: by 2002:a05:622a:1f95:b0:52d:3ccc:968b with SMTP id d75a77b69052e-55ac3365eb6mr66885161cf.9.1794626086986;
        Fri, 13 Nov 2026 19:14:46 -0800 (PST)
X-Received: by 2002:a05:622a:1f95:b0:52d:3ccc:968b with SMTP id d75a77b69052e-55ac3365eb6mr66884961cf.9.1794626086618;
        Fri, 13 Nov 2026 19:14:46 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad0fff381sm31986401cf.20.2026.11.13.19.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:14:46 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Sander Speetjens <sander.speetjens@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] firmware: raspberrypi: Remove unnecessary braces in transaction helper
Date: Fri, 13 Nov 2026 19:14:44 -0800
Message-ID: <20261114031444.871124-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107-fix-raspberrypi-firmware-v2-4-5bfe605a5cc5@gmail.com>
References: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com> <20261107-fix-raspberrypi-firmware-v2-4-5bfe605a5cc5@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_191449_730131_491E9111 
X-CRM114-Status: UNSURE (   8.47  )
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

On Sat, 07 Nov 2026 19:21:34 +0100, Sander Speetjens <sander.speetjens@gmail.com> wrote:
> Braces are not needed around the single-statement arms of the
> wait_for_completion_timeout() check.
> 
> Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian

