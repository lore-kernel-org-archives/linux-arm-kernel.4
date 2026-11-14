Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E65606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QiWs9Fhk;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CuCyt3Kl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BFJw/xnt2UTIRXJ0b6cAPbUEvo6Sxa3vSGm5EiU5G8w=; b=QiWs9Fhk8NLzlw
	ghaGQlWsowgrMMlghkk9IMucrCdKbwN/9wUb35xJcQ16uOeWXgmvoqhuROtZ5O61vMdIVbV7vAHny
	bq7wJsPkzAwnWYtuPcRvMvUuS0Urj+KdNixyTFIG3McikXhfq4K05OfW+ViKXUUTnThP7LlxStbdv
	Y9JVKpwTEJbME9qEmfbGYRJrqniEklWz1g8TOsTi9I0dSmbm/zxQ6SEkesgnHHoKgvpRhjbuFsv7P
	OxJEWanTCUaRIcSG7xDKF27o//9fvorj8/OcT6lDupiVjbR3iLYOLy4g7tnXQS+4AJ6QALbVJwL6D
	5szWI5HG9JRIZw2Ol2uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4Ow-0000000FFEw-156J;
	Sat, 14 Nov 2026 03:26:02 +0000
Received: from mail-pg1-x563.google.com ([2607:f8b0:4864:20::563])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4Os-0000000FFDI-1HpP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:25:59 +0000
Received: by mail-pg1-x563.google.com with SMTP id 41be03b00d2f7-cc758830601so2148567a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:25:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626757; x=1795231557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BFJw/xnt2UTIRXJ0b6cAPbUEvo6Sxa3vSGm5EiU5G8w=;
        b=YlTvJogn2E1h3o+ZHcbEYqcfF0+rA+l9HOM6x7m2BjTJw2CWeAmkOG6D9HKIhbdjeL
         KV1K5FhmhikKOfYc4c7Z2WusxMJ0TL8fOK1esVydgkuR2EOCs+qdA7DfFmXScq8QQFst
         V32uiubOjnNJqycAKrRmy9kz4HvHZUkK6DotzhXe6S19yUWAaYZbKi3ggPdqWvUScYoW
         J8BNucEBy59RK5QnveaNjM/mRe7W/0XMFJoALV69vsUPOHy9AOjwyHJe0Rby+4dm/Dax
         kOLjqOFSDm2KWD0fl/MuZAtpAfnqx9FAQO64d4h7VIvo3hTDTnJvxIvEDbiRj+ePOK6S
         Zxpg==
X-Forwarded-Encrypted: i=1; AL+hErFL2M2yXrgl7sDyHYQFRA5EAAoX54anRCbdwcJuFppJHU1vJfzNjwrtMvc/ZJdQFP4+wPHmOTzcnS80xutzzPHY@lists.infradead.org
X-Gm-Message-State: APuU4Z+jZFUUVyz9bDAN7zZpFidyH6UhQUfutN6xEqZ9IlnEi76qAb11
	sbj1oYvFCsl9EW6S/dJcheHoJuZGMwEhM+vPfmolwPcBFUJck/UV8RFN5WXC/96qcEFbDcuUXK+
	pF4NaMsj6nG2CZzxJgJ0GYKVEnFKioq9mPEFsAmIuh+Nms1mEWuRiCZ6T/ELLYvoVcs3gvnQyYY
	Cn2U/6fvkoTxenC05h7GVfrqUN5eQsR6y7Fk05WE0h1bXNksnx56ePBEhbNPaog0zxM8F6bUxAd
	6lj7Brbd8pExwX/ZLY1jrNd29tc7LW7h4w=
X-Gm-Gg: AYBFou2jRt+KJxbp4Np54d4FdwUeufKFddwDr1CcDwzxZm7q2pUNHRHyoJ3F09rP7Jj
	wRYNJ5wIvXNONRF8653mT2C4yilIc15rfoF9iwOOMRoxVVfzVdeOgyzCD3x3bC39Ff9hrAVZdoP
	01GCZHqrTSrqk0mOt0xybezmYVB7gIh4/JfTQAgIgqSL4q2qKmyexmrhikiqjdHR5/mmxATm3Ki
	eHF0cChGAwri37aznwIX0sXogVR16KRNgLPW+NJV/1y+y+YjnOkvYCZB8m88tFAKEBk55+Q4+NY
	K6+FD9U8hwdGv38NH+TelTe6UGKlUGTsy3B11pxctlfaByu9R3G0Uy0AKOeql5FY1mFfA4hvyjJ
	hUXc7p+yez9UaR7JrA0wp3mo3osaz/2KaI3wQDg5v8FWoplOv0bDcRJvCC77Thlij8x/9mm4YFd
	786taPtM+453RRKfP/6GthHZTvxkP+qU885hbbzErtp+c=
X-Received: by 2002:a17:90b:3d44:b0:3ad:6090:a190 with SMTP id 98e67ed59e1d1-3b1b0cac9bcmr4428690a91.41.1794626757254;
        Fri, 13 Nov 2026 19:25:57 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197cca680sm9260773a91.6.2026.11.13.19.25.56
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:25:57 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36d1353fdcdso7001832eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626755; x=1795231555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BFJw/xnt2UTIRXJ0b6cAPbUEvo6Sxa3vSGm5EiU5G8w=;
        b=CuCyt3KlgS6bBd7lKYOOT2eGuWHnSOMrT3JbrbLRju39fFMyKNxr/uPRm+LVUSLGKP
         kMp4IhUT0+k5DbdROGw0GphlfI93EIAIzkkiUiNd2ppJTUB7F9FG3dYJ3k2tOc+kcRx1
         yTP2iB4NUsRXhExwsBCxm88TZzvBru3/3yWL0=
X-Forwarded-Encrypted: i=1; AL+hErG/8eWFrt1hWR5pd6fG12xuPzkA8RFLHRQ3e559SA0XjZaRpPbivelgj8tbXdv1EKrM0vak+0rrnuy3UQuVdQ8E@lists.infradead.org
X-Received: by 2002:a05:7301:d819:b0:370:a11f:dcb7 with SMTP id 5a478bee46e88-379681c73a9mr4249927eec.41.1794626755299;
        Fri, 13 Nov 2026 19:25:55 -0800 (PST)
X-Received: by 2002:a05:7301:d819:b0:370:a11f:dcb7 with SMTP id 5a478bee46e88-379681c73a9mr4249896eec.41.1794626754618;
        Fri, 13 Nov 2026 19:25:54 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d73dsm12221650eec.2.2026.11.13.19.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:25:54 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Martin Wetterwald <martin@wetterwald.eu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v5 06/11] platform/raspberrypi: vchiq: Register vc-sm-cma as a platform driver
Date: Fri, 13 Nov 2026 19:25:52 -0800
Message-ID: <20261114032552.873583-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112-b4-vc-sm-cma-v5-6-d25e3b687e71@ideasonboard.com>
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com> <20261112-b4-vc-sm-cma-v5-6-d25e3b687e71@ideasonboard.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_192558_467313_50D08505 
X-CRM114-Status: UNSURE (   9.40  )
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

On Thu, 12 Nov 2026 16:48:04 +0530, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> Register the vc-sm-cma driver as a platform driver under vchiq.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian

