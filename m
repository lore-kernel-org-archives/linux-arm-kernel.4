Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B1B606A895
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uU2+mlXR;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=X7I7dGHi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Df9Xd9VZHrZ3bx0rqok9KRd1CcHGH7mE8EOxZfY9S/w=; b=uU2+mlXRWgNCeW
	OAM4Z4UxW3DIpezHmzx7aOsiVIKIoGrsTd3yVWpNgAzENDe4tenmmsTNcWgAl0VR9L1jgCN9hU+Gx
	lZOlg2+mlrWEbqDjdou/nNV7nnZXS02OFBm32wh0SRVRRY9x3tAoFzkzqPFyfq9nUD6FMw2dpZ5yz
	GTmx1OaGcY+vqWy7vViKqKLgHP+rknhdnMuyjuOqFx+GQSuZ5upywQPYvkKsiFzs99ZouVygwben1
	9We47xV6b5xtHZF8+bDQNBha47Gy2ILn/v3Q/lNT8L5ryZFbLKBO52PRCg8ipKDLSe00EwYSecr5y
	TfMoLRSV/uSs+U7rG6DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4Pn-0000000FFjI-3ojS;
	Sat, 14 Nov 2026 03:26:55 +0000
Received: from mail-pf1-x461.google.com ([2607:f8b0:4864:20::461])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4Pj-0000000FFeY-19eK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:26:53 +0000
Received: by mail-pf1-x461.google.com with SMTP id d2e1a72fcca58-8b9c51097e2so893238b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:26:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626811; x=1795231611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Df9Xd9VZHrZ3bx0rqok9KRd1CcHGH7mE8EOxZfY9S/w=;
        b=l0q6d3AoOhvUloBiUwwVbJ/HsjTN5A3bCU8O2OJoAfNE0PrDs3u4PRvG7pfMJPPe3Z
         hNT0/L/05VcA78LTO4qx7yRhUjsgu6In4uwBxKM1W8zBXXruR3g1kJr7GVP00tYXANvE
         P661ualc53bizPjmMulQlszgltjGrAuRXXKk2jZw/35NQBQpV52BfND1KXK/IZgz56GU
         xfKvLrPb9LiXu0Ako0OdQek7nSXdVaaUvEej4CgLnJdtwRkNhE30Y3T3w3VPI52Xeax/
         WhFs/QPnR3/iiVygkTJEpIyxJo8uNHlJFQLPWfp7lNrxSF/jX7G2iINLMjYZiXAtAtwq
         j8oQ==
X-Forwarded-Encrypted: i=1; AL+hErG8a0PSNcRmoVZDHiiYPxOD2DFTdmCZ1YMrZ4hnErh5RPrgCCCdVxffPADmszjnWa2uLURgDO/60g2cYJigWuO5@lists.infradead.org
X-Gm-Message-State: APuU4Z/oGXT+dORPx4jWuYyTvRGw0GIoAoQCxWXEnGjCPcXYJYUqQOhB
	b66ZaIZDvenHsIAqbPZTc3KUaUkitC54N8P799Oq2Xja3OAX4Y0D0CeGQjJl78lORhk9zFm7JYj
	mRG1YuxrvhcTIUXVkJmghyeLQmEp3DWLZDNV8XPU1qtm1TsM9ptOiPfRNoA3yk5r5XkwAz1wfHq
	OFBs3afxgrwO7+VG6VWWjh+Hq8dmoAROsllpP6s9Lw5ej4ewvd0TW1ZUh9abZmJ4GdJw9wYBp9O
	7/uydnx8BVPirKdnYlJUJKt55PdHiC95qc=
X-Gm-Gg: AYBFou26a4BY6scQ+plR8uHOK4aiF90THoGSvei6+26uDUHEoqYZLh4HeLM7TzY3cSe
	JB1Ioe4cNzZ6M4iYhuIvGK1iDMqrzn61fZbu+2KIStj8L7prNSKKTxUz+nRsXOw6auK/nB3Szdu
	Ic3Nz1Fdnl4039fzdIxjbuKHIo734VKrwsr9nbRln8y9njtQGCuU6JAg+pQ4zuSOzV4cZMkhGf+
	uTljbnQoUdRXcIxh8i5R2+c2hPlzSfFK4zpUjM1vSltKb1MXDwOD+jBBvi60+akbasK57PZok40
	5tz1wBqkcinYXRf/fqYL0EE4bt3zSCQY2uUyZrUKVtIG/CaT3fJ76G0AAjyfz30IiRY4ow3iXuB
	WrPhWgaI/Tyb/B5mIgDguoJHqvRdw9nJFmHD2GZWWVwD18v2QNojHpgYwlEM043hT
X-Received: by 2002:a05:6a00:1389:b0:8a0:70ff:aaf0 with SMTP id d2e1a72fcca58-8beb7b1eaadmr4000246b3a.49.1794626810462;
        Fri, 13 Nov 2026 19:26:50 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-8bed282a9b4sm131434b3a.18.2026.11.13.19.26.48
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:26:50 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so1232106a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626807; x=1795231607; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Df9Xd9VZHrZ3bx0rqok9KRd1CcHGH7mE8EOxZfY9S/w=;
        b=X7I7dGHiaWaJX9pS1P1CUVyb5Gm+DNgTG//CQog2aMGAAQWCqUC6KLRc/uTxrZ0chO
         JxbQOnx9uprnuYE0lTy+KiZPVrTGRbWFN1h3S5m+OsVJkuIoc5ZOCrLx3LGYec0tA/n1
         q65fQKrBYn9p929K/bdaYk8UGdmS0eWtvnkyo=
X-Forwarded-Encrypted: i=1; AL+hErEoBCxJUm23kQSJnGtOiVc56cruFRdws00Sc5Y/Tki9Re2pjhakt14q42U1wP+xJTSrbJEU4LbaVmR+9/DuEyIC@lists.infradead.org
X-Received: by 2002:a17:90b:2f0c:b0:3ac:6e91:3f22 with SMTP id 98e67ed59e1d1-3b1b0b85d23mr3739872a91.52.1794626807456;
        Fri, 13 Nov 2026 19:26:47 -0800 (PST)
X-Received: by 2002:a17:90b:2f0c:b0:3ac:6e91:3f22 with SMTP id 98e67ed59e1d1-3b1b0b85d23mr3739840a91.52.1794626807045;
        Fri, 13 Nov 2026 19:26:47 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc188ff97sm2060162a12.16.2026.11.13.19.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:26:45 -0800 (PST)
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
	linux-media@vger.kernel.org,
	Paul Elder <paul.elder@ideasonboard.com>,
	Umang Jain <uajain@igalia.com>
Subject: Re: [PATCH v5 11/11] platform/raspberrypi: vchiq: Add helpers for vchiq driver data
Date: Fri, 13 Nov 2026 19:26:44 -0800
Message-ID: <20261114032644.874052-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112-b4-vc-sm-cma-v5-11-d25e3b687e71@ideasonboard.com>
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com> <20261112-b4-vc-sm-cma-v5-11-d25e3b687e71@ideasonboard.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_192651_321919_4DD32795 
X-CRM114-Status: UNSURE (   8.94  )
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

On Thu, 12 Nov 2026 16:48:09 +0530, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
> Add helpers to set and get vchiq driver data. vchiq_set_drvdata() and
> vchiq_get_drvdata() wraps dev_set_drvdata() and dev_get_drvdata()
> respectively.
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
> Tested-by: Paul Elder <paul.elder@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian

