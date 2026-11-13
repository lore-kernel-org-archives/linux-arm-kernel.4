Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04733606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 08:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AyVv/ubX;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CJtkALgh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QJxalrHssAZhNnjpSDoFedeDiy/biVpvzIuN3reWEpI=; b=AyVv/ubXyG/Xhf
	Pym4ulXUxh+OKvWDEiP9tTtoIGwjoXa666NFGy2tmXmlVEWsNQ/mRpejw1/aeuOOXL0IU7eBYK7py
	InQ5Ld7qQMvin/4lhDOCXWnf3PqNEaOqabIC8kDpJgdD9WLtkaMqvZEFiZK1kTYEhcO1IhA9KDPqD
	t8nbX6778hObaeVvLdEt/f4oMalB58MF5SwMqJeC2z082TOgc6QttP4vCWB2yEbGgUag/mVP3MLBJ
	6xDKZIzRsMB14I3kyNEPwRCv8w0hjZBW28pFdIr1BYTEBTw7ir5ErvB0AYqT0mQtXYF3ox0oH5XAL
	w7/1c2b8ji1IWzmE67Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmEd-0000000ByPC-1UB8;
	Fri, 13 Nov 2026 08:02:12 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmEY-0000000ByNZ-3Dih
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 08:02:10 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so248713f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 00:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794556925; x=1795161725; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QJxalrHssAZhNnjpSDoFedeDiy/biVpvzIuN3reWEpI=;
        b=CJtkALghBTrsYyNxllJQqkGKrXLa1ZTzBltK8V3ucXX4ypurAcp6sETN3eopqZHp2H
         c4w3wHgyD25WTCZLOYY0GqiQPRJUaYxCJYMhURIRk/r3ZafK5sQPhJjGTAFVfDdWlM84
         wwJr/fj0tnXC3aJrdKMWT2ENcnGJV+gPEIf11YXvVT5VX7yqPb31kj8WkzbudML8/SgR
         Qw73Rs/0jG3Ikt6GXDCVyMFKybYIqdBW8YPsoOcmNk5ToO/AAm1TmeeiqaGdqYaSpAn7
         EPF8fUP+wmYpmJHWmt2uu0EAA7eB3ZjeOu05/NYjNK1re8lMXUssNf6vkwwvlSOMJLvx
         xEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556925; x=1795161725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QJxalrHssAZhNnjpSDoFedeDiy/biVpvzIuN3reWEpI=;
        b=sfNDKFkAKmy095Ghp97dbSeLJN5CvZRcLjtlIQFTEi7vV2fVC0HziJ5KvXvKFstGVD
         szYE9cHFtqXK7B/6coxFdgmFXvTNC/eJeIv1m/2AcIBxsiagCa2JE5TdRWaW6iU7lHT/
         d7/7/1zfOtVyU02FpkqzMtQH19e+zUR7wc6wDlbx0mA5RYYFXe9nbBUCvslBUNHETh77
         RGNYAZt/aB4muy1CTNu4iR7m9qmNAgFMV49t7o+Aj6cz+pY8SYXtIEgaeF6tBKLn/Avx
         DNhEVZBM3D4Kxe0ls4Wk/IKAoQsDxLwAxSmGi6O3eFCK2K9bcpA5is+ncGLPdGIdhE/n
         b2xg==
X-Forwarded-Encrypted: i=1; AL+hErHY941AFTtHaaIFc0+bLXfrBJXExDsI207fgDRRnd8UTyJoW6kfvYII82UDGlZi0wt/YTes6lKPBMeU7Fy2ptkI@lists.infradead.org
X-Gm-Message-State: APuU4Z8QKJM42YIAl/HAcwbGif/dXeJMvbNfFU1myWDcyjBWi+ZwmiCl
	d3BTk0WvvFYHBdd0CId2E42EkT4jz02YBeLhOKfic5UC5Pnw99FlMHiQ
X-Gm-Gg: AYBFou3mORnAVJMqpgAW67lLVIgi+iw3qLLvPmFUbHKkDiJnQAB8tDPXKPDjZmUGSMq
	Ak6ezH7aWhmrYu9Xrfz4cqMQz4uVsewtDlxQ0LhA8ooMFnc4LBib9f+KXDNkbXxfaJVwVMz0tKn
	h13XqEvkqOSZu1NelR+HnM2hXC6A0t2isTkCLGj4dHlQYC0WUNBd8x/0JSP6VmCgM3bx5e8Cub8
	zoqbiv8/xvmvkcIiK+631dBJTCibXZq6MEuhJEN0OPWoAhCM75Vjle2Ek/kH1lZwMCiQ+3fE7DC
	YtRcmN1iofeNzBKgCDEIQ50q5XYJn9TSevvDagJhbrztlVwbL0yF9lfdd5nqq+bY34dI2Zi/syQ
	BOVXz9PZ46L8TLwkHfKBl/VvPaPOvVJhIPMZh0p0X2Ejegu4UE76R9kSaKJtmu6n7pjgI52BzJr
	ym2HUhyp9UtHR2pCAjT7mX+e0TJ3s+Y6vg0wQ7rsOWySbOUjavTdGb4xCTDoAQU52s4X/6aBpzY
	0r26jPpdrXo3QZmcQSJZszZYI8F586jwXH1hPJPcoWcr0Uu/Qb9dAOecYYUNK/YV/QhXcehvUWZ
	fBEnWXpvNjiDxvu3J5ZhlFmE6z9+NyoplhC0
X-Received: by 2002:a05:600c:c4a3:b0:4a1:9663:7639 with SMTP id 5b1f17b1804b1-4bb55ab5526mr35140005e9.34.1794556924633;
        Fri, 13 Nov 2026 00:02:04 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2acf81sm121590835e9.14.2026.11.13.00.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:02:04 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Yao Yuan <yao.yuan@freescale.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 0/2] i2c: imx: two fixes for a DMA write that is not acknowledged
Date: Fri, 13 Nov 2026 09:02:03 +0100
Message-ID: <20261113080203.1046422-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113073250.1037215-1-mehmet.fide@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_000206_946544_BEC0015F 
X-CRM114-Status: UNSURE (   7.85  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A correction to the test note in this cover letter.

The v6.12.117 kernel I tested with is not plain stable. It carries a
backport of commit 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non
dma mode"), so its i2c-imx.c has the interrupt state machine of
mainline. "The touched code is the same" is true for that tree only.

For stable: both patches apply to 6.18.y and 7.3.y. On 6.12.y and older
patch 1 applies with fuzz and patch 2 does not apply, as the interrupt
handler is different there. I can send backports for those trees once
the patches are in mainline.

