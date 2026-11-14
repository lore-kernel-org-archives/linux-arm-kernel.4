Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BCD606A333
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d3CoJblx;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=A+m/iwG/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=YcrG+QHKLRQuEyjJS7Of5R85aQNfVdEJbdaiVqqtdpg=; b=d3CoJblxDdsnu2JsEBagGbzn4C
	aA5UpYuvJqMwl8j+2OJ3F9FnXpmIqKCKFECgJ06F0REqjuPb1gtZ/SsKaHX/1FGP/0uJw7UVDqTPM
	8t9t38tvaEkfcFVVonATn2RSmC5LMv9R9PmrQ5uqGtPH3XqC9fFG3cITknaMi7dOPp2ZPOi2aZhGt
	CnOLZe+Zv3J5/r6Jk9MvBiHVOog3Ztp4U+6qhW4d+s3m6K27aqPG/hDzlrDYnM8BWC5dG1Jgd8rNy
	fcRHSTzI98h5dsrF2Rty9v1c2i6QJE6dA3qzDLXwd5zGKGd4eN0JV+2AVNPOW7CtUBeEekLa3uii0
	QZFPWhNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4iO-0000000FJCC-2kbQ;
	Sat, 14 Nov 2026 03:46:08 +0000
Received: from mail-pj1-x1064.google.com ([2607:f8b0:4864:20::1064])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4iM-0000000FJBe-0CAm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:46:07 +0000
Received: by mail-pj1-x1064.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso1685922a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:46:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627965; x=1795232765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YcrG+QHKLRQuEyjJS7Of5R85aQNfVdEJbdaiVqqtdpg=;
        b=JWx7Tq43MVwdJn2KrA4PM/yzZA2RKlW1+qK0j9ZVpT/FQZ8237MY3n3/KnbJXgsin0
         keDBVxXSSgjyuGN0Ez0YtKeBK0FcrPkkWCBDqWBBJzitN86FRWMjGSfSbT6gW8rYRtTb
         o9Dsx5MVIrDGgBn8ddZbgy8u6XjOq+G+vye/0CaRCOYFL3hJpo8MUmeMEQOokxariErA
         F1A+39WdRazCXF1TqFVSDO5iCfQ//qQUGGCfX0DujrIRYVW3vMcRqOn2uSAP14YzFufX
         sKd5PRNDADKxju/2woJ/HNsfMJktV3OgoKRQUL3eFPwR63mES2XhPmdnxXT9b71tMIdF
         CR6Q==
X-Forwarded-Encrypted: i=1; AL+hErFQxx5cR+MlINxrwJ8f8KCodfM/lCVoHHCT60SgDqIu0q47laOVbN5+DXNBd12NMnnY1TD6uR/j9Xsv1oF67CMj@lists.infradead.org
X-Gm-Message-State: APuU4Z+w7V7h6Kn4B5nyUWyWuWS2AC6LQLCRaU3bIQgWM6dJkoWfFdaP
	sOL9aDTUzh8OeX6elXiWJ/UTpSo3sc+pYX2W3KI4ZF5NW/B0IIcZF//Z6rRg70jdL3Xd6HwNBuO
	TO6inZrlRgYq00vYDBvcaefgJfo429uKMtJXT2P4UZ+7fGbIEDEKyY8zufEDuEDnd9jRMvnZ7mD
	XceqtBKNFqdBzhF4+W+MaoXmvFjxB2S0XmlCs2yN1Zqaaj2cEeoWQNJjaWpkI4vcy1ysr2clglB
	ElYCmV372c961+dS0zAZyggwZWsrGbJ5AA=
X-Gm-Gg: AYBFou0loRO386lx2UFVYIQOlNfqvaBloRHqYDvDyepP0WHe6d2S2eMRefjXWc2tfLf
	oHhv8lLRaDv0TdfY9m/CaQMex67ec8GAwc1HF6Z9QfXSDg2XWDPf1lZkpvr8NKE/qIxWPJtIvCZ
	SCEtq+Qzrbx+OqaBrygaHmNMdiA+FpXR69DrPIZdUAMZvxExgF2hoOf4cveU7+NDVTPdh0XavRS
	2zJDnPeUAC9voqpI+8NjeumhrQnyAMcufHtSVK9NN+LdE7DCJPGZdlMUB3v8uwVPd5W1/RBu+os
	J6BzOfY2jrweBxxd2Z9/5ptld8m4pGIA2T9/dn6x/+JSZ5Hpnr43FTrfvgfyzCbvKv88ScyXYa3
	CEvpx+/yjgATCK2/dRa2XBopbagNW0lH4h/x6fRs1pggpKT1PC5ryHXX2zsYBQp5cIepaGIugpI
	OD66tQiO0kolyXeQEZozBCwM8Bu9eShO1ou8tpWOZc
X-Received: by 2002:a17:90b:5483:b0:3aa:412f:b0a7 with SMTP id 98e67ed59e1d1-3b1b087e1c4mr2743008a91.5.1794627964921;
        Fri, 13 Nov 2026 19:46:04 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197a330f9sm9275050a91.0.2026.11.13.19.46.03
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:46:04 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91eb3a63064so37018406d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794627963; x=1795232763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YcrG+QHKLRQuEyjJS7Of5R85aQNfVdEJbdaiVqqtdpg=;
        b=A+m/iwG/gZ4iYXkTatSFT7V/YyIjnvHERsxM5nLpOPQGsSiU+NSeZUqMBb6bGUW9VL
         M/xsOMKKG6xqi430M5K6XDQhygorb7o20biWFtsB276lFyhjOLztzMAEDHIkRKmcZVTM
         RyX/hdNH+r5Cx3S7RS0yRJKEuHA8OJqZ71a6U=
X-Forwarded-Encrypted: i=1; AL+hErHbzrxV+JciuGG/VrdlikjK/N1B5cb2sWHvfBwMZZVCfANwHVvdDuQur0dxWjVvmiKRgVSjr9Mr2aX/hi4hLXTg@lists.infradead.org
X-Received: by 2002:a05:6214:300d:b0:91e:b8aa:69de with SMTP id 6a1803df08f44-91f13a9f655mr126922336d6.36.1794627962841;
        Fri, 13 Nov 2026 19:46:02 -0800 (PST)
X-Received: by 2002:a05:6214:300d:b0:91e:b8aa:69de with SMTP id 6a1803df08f44-91f13a9f655mr126922136d6.36.1794627962425;
        Fri, 13 Nov 2026 19:46:02 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d453casm34694466d6.10.2026.11.13.19.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:46:01 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Martin Wetterwald <martin@wetterwald.eu>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Gaston Gonzalez # Raspberry Pi Zero <gascoar@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/2] Broadcom drivers fixes for 7.4
Date: Fri, 13 Nov 2026 19:45:49 -0800
Message-ID: <20261114034550.878760-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_194606_088412_D4B98532 
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The following changes since commit 7475ea8b58616b33c04afb976cf0fbaad9dd63fb:

  Linux 7.4-rc2 (2026-11-08 16:22:20 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.4/drivers-fixes

for you to fetch changes up to 109d5fda6c07649d4bb9270fd99f5c75e3e49fde:

  platform/raspberrypi: vchiq: register bus at subsys_initcall (2026-11-13 19:36:46 -0800)

----------------------------------------------------------------
This pull request contains Broadcom SoCs drivers for 7.4, please pull
the following:

- Martin fixes the vchiq driver probing order to restore audio via
  bcm2835-audio on Raspberry Pi platforms

----------------------------------------------------------------
Martin Wetterwald (1):
      platform/raspberrypi: vchiq: register bus at subsys_initcall

 drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

