Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EDD606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 07:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qPd7/4eE;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b5R1T4RY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=R52vvQCOEP2yQoOtzfmf3tXHj9q6TsgHnskwuN5yzD0=; b=qPd7/4eEnurILEItAO426v3n3N
	qed4S+tlIVIhz3G1rW371XlNwSvKN1da6kDFWSPYjeJAfSHpOj7vhpecea//Kp7u/QsphVnn4c82w
	YkFdY6pDz8q25P4t49Q0TlPAKb7NU/uLAPrrq3T6tpeY2MMaEubgEQwQY/BCfxh37pXXiS/BYqqum
	Wp5HThIW3RfHnI+CKk7h7XXmqbanpW8pBFPoHDh7j8P5OJAIKr/iXCBm281Hox7OyjFh/RKch0yLU
	FdMOeOi4YZRlAhrb+KteU57As9dVGnCkAfpAA/TMM55zxMbITK1Dc7GAiKQWtnvJngdAEWdgYqAC/
	J2R4OsCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7L8-00000008rFc-10kr;
	Wed, 25 Nov 2026 07:22:50 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7Jt-00000008qXK-0xXj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 07:21:45 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-3869f03af6aso4666247eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 23:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591292; x=1796196092; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R52vvQCOEP2yQoOtzfmf3tXHj9q6TsgHnskwuN5yzD0=;
        b=b5R1T4RY5kiY5PFziH5xCudZ2loLcLSBska/9+T1LbQL7hfmTB0gaJuqZoFv8TuR0L
         XagwZyDkJ6qWKt5xmgXXWlR1htnteEW2rhbyQ3CYD82lTlLzR0Nir/YFBE86IZmi7Z12
         0qnPwMyqfRWSvhVZ2i+As+gHRL/BSEtZffgSvrNreNiJj2i1AnVsoEQ0pteAeVCH0SQo
         BkySICYtWaOnby/G6eLpH/FkjIOMMVxjxre5u2/obnPKoESpv8l1EtpdrekG/ewtxDLx
         GhE9ImveQiXSV5q2tVYBvNr/puR21sDKobY3+q0fH3lJZCDt2Ew3HA8ektYMonRJlm+Z
         vAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591292; x=1796196092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R52vvQCOEP2yQoOtzfmf3tXHj9q6TsgHnskwuN5yzD0=;
        b=Yl1H9XXSZwcSEYGdU+QrMPo/CZRya7JffLt7uHlHsurNWT88gbe1rYq3t82etEjz+/
         HAKVc7Ka4X2emoppsoWZx4qK+5t270Wy0C+4cy8l0grSCb8YcrUt4eAbVCaaQIZbl5iQ
         1gzlknUmrTZa46bBGZyr4mKvK96pJZ2UgUchjPGmGvc83G36ZuMcHBUsmVKg8NPCCJvf
         nSQLZVA1FUbyEt8CFcfg98A+Fo7Ksyksi18J4zRhtJoZF8ts1HJboTNkhV79ieVisR+G
         bZYl/0/5ApmKHVfd8xvW6cvplyglPbjLnpXazjmeJlmC4qVSlRgo1aZEke5dkxXNBeqU
         MZ6g==
X-Forwarded-Encrypted: i=1; AL+hErHJvtgFhqrOv0v8x9P4WW5yvz92z1loeXo19gtUTzqfPYkpeKoFXXXLuBQKoM6v/mE06gOWlFtHmfweNtA6udnM@lists.infradead.org
X-Gm-Message-State: APuU4Z/IGL9tR8UXvv7jE9HNcM/kH/BOvtRTAXrei78BrSBrz2Q21PB1
	dZLKlqTxqxkryGy6JlCTgR+aCDcKq9d9HZSk9E1PaR/cIO7P8TM6qkFh
X-Gm-Gg: AZFdTZeETxltggnHIbSjHf+LF0YehCScmuzn+UZDXiHKu5zAI9oaalKPxdGZmzIgML2
	pZHpuAppIy6ApZodnuoT4IxjVhmTwRDQn+P/mb9nZ6aQxe0hR4NB8HoXspc6Z3TAzMuUj5N6XWm
	ojZ0YEnKlPImmO2hs1oDNjeLRdPvb1TnUL8jQep6BSAZVqYEQ038U1YVaxDDnvYTAjwtcZLO5+m
	iUu1loiubrYA0RkHnW3ExCALM9vXzUfME1sGiyeaBUtFJvLBWTesPC68jLZ1qKEOr8tagNLdFPq
	nTDALOttuUqJStvinXJN//MkoP0fhxd35vOK3qfRqBC2IS84BPC1tNhfrHGvc0V1Odeir2x4svP
	x8eD9MGSDYaZFOMwoDUCgfgWKcRbSVg6/NDk5/pgP7T6Lcrpp5sVEdfv514B7r+Eu5WD4c2ehGW
	dmiLVTDwEI2Xw3dahus96GbnWIKJ5UfSEaylodmyhLVG4veH78y+NjwnYnY7CCZwTTtIJiDxgH4
	V+sjLubQBHqea2ysRINBVlKpIrXt13TpQdMrxVJPePXK+IXw4QBY3hE3OEb3EsmotaKy0DMzwAj
	ByaSBIpm5khMTSejfdI6KeZQlc/OhU70jGGB+OvPKQXvUXWOxgqLtSba6j5d8Y7Q
X-Received: by 2002:a05:693c:8943:20b0:386:af00:e9a6 with SMTP id 5a478bee46e88-386af00eb48mr8612674eec.2.1795591291989;
        Tue, 24 Nov 2026 23:21:31 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm62232352eec.11.2026.11.24.23.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:21:31 -0800 (PST)
From: Prasanth R <ragaprasanth@gmail.com>
X-Google-Original-From: Prasanth R <prasanth.r@lineo.co.jp>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Support Opensource <support.opensource@diasemi.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Prasanth R <ragaprasanth@gmail.com>
Subject: [PATCH 0/3] Input: clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:21:21 +0900
Message-Id: <20261125072124.2997511-1-prasanth.r@lineo.co.jp>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_232133_266737_ED27FC87 
X-CRM114-Status: GOOD (  10.08  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Prasanth R <ragaprasanth@gmail.com>

These drivers set a wake IRQ with dev_pm_set_wake_irq() and never clear
it. After unbind and bind, dev_pm_set_wake_irq() warns "wake irq already
initialized" and returns -EEXIST.

Switch them to the device-managed helpers.

Patch 1 is tested on an i.MX6Q SABRE-SD board by unbinding and binding
the driver through sysfs. The others are compile-tested only (ARM,
clang, W=1).

I used an AI assistant (Claude) to find these and write the changes.

Prasanth R (3):
  Input: snvs_pwrkey - clear the wake IRQ on unbind
  Input: sun4i-lradc-keys - clear the wake IRQ on unbind
  Input: da9063 - clear the wake IRQ on unbind

 drivers/input/keyboard/snvs_pwrkey.c      | 9 +++++++--
 drivers/input/keyboard/sun4i-lradc-keys.c | 2 +-
 drivers/input/misc/da9063_onkey.c         | 4 ++--
 3 files changed, 10 insertions(+), 5 deletions(-)

-- 
2.43.0


