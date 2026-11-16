Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D4660A5BDC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 13:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xXhM7/E3;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yEVQguNP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OfHQHM3R+bJudBxYYvhr0hB1WtSESOcSRLIVPlqiZOs=; b=xXhM7/E3q33HKV
	pKqubFw/579if1LE/KpsXcmGioS/N3u9lt2pjhCQoxf+jnfufdB7PoE7lVncjekgAWzTGV5iYln/M
	K9+R8I6+1ZxPgTronfpAoW28m/J2kWiZdMA9iUq4yVjdcyiav513P5fv0veU9/zF9JW8Qxm4LDZzE
	WB2F8vKzsWdj/zSdmPmKpZSMQYz3EM9pYUfY9+TxY7vuCSdi15gtde6RyvzNiGu8XZQzf9cf8ZJ0F
	kLcIiHp2oESmQLfeoV4XK1kl96QeGKku8GKZ2sHsKVshNs8aKPKFxrnZ/8KnbfV/DWC7kVyWlr0YG
	LGcYPAhIrromebVx5pbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSx6s-00000002hdD-0XrP;
	Mon, 16 Nov 2026 13:51:03 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSx6g-00000002hav-3ntb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 13:51:00 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4b467581b98so29609485e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 05:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794837049; x=1795441849; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OfHQHM3R+bJudBxYYvhr0hB1WtSESOcSRLIVPlqiZOs=;
        b=yEVQguNPXhV8f2+10r6vX17WCOQq9qADNIwKNcNcHklyKryzpA8vqTy6ofX8i2Bg1Z
         qtxJxgiwNjK27gnZHueCwuotNJA1ufguoYWauoiuiWAjo3t3g55NEE0ilqVfcNWNrd+C
         sm5T6p0XQs1wyc+YB6r4jBpxmgrrwJS5l+PnjGFDBMqT+OHN8Qyr7cXcfKCoS0IDURxe
         /9LG2VmY07WKFknRVbBFsXu7VvczLU6MsIDn9k+vRBEdUksOTPn20j123yQJHPvEd/II
         lqKszC/W+QMfXxOMWf7ln8fJMOd2SuzSnD+vErRjQ8XJ91QrNWoP+TD7+K0DihmsvA+Y
         LALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794837049; x=1795441849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OfHQHM3R+bJudBxYYvhr0hB1WtSESOcSRLIVPlqiZOs=;
        b=XnGeVfq3LRDG4vpBCRY/FlhbUPrfXDX1s1HnpOie8re5STXuru4GpgEHVQPqVTILvM
         e76WKTxkpisvQIecFZHyn//9DXoTTPNq7i+ovfAVTfXtqW97kmGcncG8Ha4Jym+y3qW0
         KhRboEWAiXQY9++HthAD+w8+bSIv7hKm6F7ImhR4FP0atVZ8nze7BvLXLFE6veitqQcp
         q0h1V3VQ3JZrMAN8EXld4GP+H0xLbzYM9TkyCOCxT9ngw2WOa4Es+8Gbu+nn+m+DTNiL
         4+fq/LFslsr/owrGax5SJhWLwf8ffKpppmrC7KeJvzvQ0GJpiWLTl3+802rsOcm4Gx1Y
         iE1g==
X-Forwarded-Encrypted: i=1; AL+hErGg/89Pfng4XsDDmuPJPvqLE3szfaenyPBFZ+f8HWuuHTLgtYcJ57SR7Q+Lt+DoThV+YV0idK8o1mnBg6Z/m3FV@lists.infradead.org
X-Gm-Message-State: APuU4Z/xoylB9JgrHsS5zRybBukIFNw8tXInOaKCt3ePS9RvWFuu5BTN
	XpUYQLtSSp3+OE9vF51c3byvObfSTUEs1E36kWb8by9TrnQ3kA56d22d
X-Gm-Gg: AYBFou2365sEigDFlmB9wYl5Hv4ivJl6FyM0fp1gMTrfgToCvj77psJedviYml8jY1m
	wDV+gToI3ex+Shl5njED9zBdtYbJSEFdn6EhvekoUSeuqfWXCi+D61jxU8kZORRGmLaapqGteub
	KamjgJ4LKAycWpvMGBoejKTtrBbwawnz6VcTMTODsynZ7TRqxB4OKPnkCfSyWn+eFd7HQvWuj/0
	ibFujR0s4CuIHJiFLv+puT/YoO7vpoIDZsEb6MYiqA+eve5rx4drcfbW++7fdmZQNr4o0xQ67OT
	Gu/XuBQiZkF1Kvq72vG78VxXhSpoWk14JHjZj5P5cQJoEw/BwTWfwz6VoAhJey4YoKWuWxALPHT
	UPId+OcXoP3yWkPrIbeq7P97GE0woFcZ9Rp0G3h3OwXomD9aq4TFanadjIh01Ir6HukbkZtQski
	mysAF3jM2Dodxxi9k0VUZsS9Ckg8Yv4s+fBE7yPAcLXMGkaqMLN7HT3OssqTdHid02HjR5tdp8C
	Bdw+cR84b/KIGRCtZBVgD5s50t8zWYujZZU4XIWZ4190sswy6DSbH/UQZ4SI9QrM9dKQ+r+pGYK
	G9CF1whUGvdAZhlCxzD2bPKxmkRG8ZyzZrXbAWZGeCEUYR1Vrcyf/9NH
X-Received: by 2002:a05:600c:1d0e:b0:4a1:d459:db4b with SMTP id 5b1f17b1804b1-4bb55abaef4mr221596805e9.24.1794837048913;
        Mon, 16 Nov 2026 05:50:48 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb6fb45a32sm69904235e9.1.2026.11.16.05.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:50:48 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH] i2c: imx: do not acknowledge the last byte of a block read of one byte
Date: Mon, 16 Nov 2026 14:50:47 +0100
Message-ID: <20261116135047.1379330-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116124430.1358948-1-mehmet.fide@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_055050_950175_AE299988 
X-CRM114-Status: UNSURE (   5.84  )
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

Sashiko is right: with PEC this NACKs the data byte. v2 will test
i2c_imx->msg->len == 2 instead.

Mehmet

