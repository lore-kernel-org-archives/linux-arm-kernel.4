Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343FA606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 07:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rWVxzni1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q3lRK4WP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=l1SQBJPQH32GaCf6i6Hpvj4B1BS4U8Mq3RY+38E+QYU=; b=rWVxzni1F9yVz5tQRpY8zWVo+V
	JMZyeVgE/FIzp798J2190UWZqBMXtspX5stNHKe3VjFh00p0DmQkd6FfCksA8wI0vvCsJhruk5b3z
	xDPkpCEPAPGVr5gCKQbF0l4woIq6dESGzwU4T8PoWRv4Gfw5UXQhgdANaKw6LcB3DjswfiY8AnNcF
	xCxL+qPVosiigX1biiywudwY1kaUVLYrQgIjaNjZ7AvXXFQml6flnyDOI+jC+wcR/fRrzRArY8q6U
	ajQlIae1cafbJj4hjbeAsM2eQ7QDkQh2RDHM9DjEJu37q3CZicthQvtHfKuOMSEKVsoHZUVGrLfEo
	rxP+b+sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7J7-00000008q8t-04PW;
	Wed, 25 Nov 2026 07:20:45 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7J2-00000008q7v-4AiW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 07:20:43 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-38190551625so10862395eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 23:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591240; x=1796196040; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l1SQBJPQH32GaCf6i6Hpvj4B1BS4U8Mq3RY+38E+QYU=;
        b=Q3lRK4WPhpLn1b+0SfHx6jDrS+XxTGkkzEb28j9AqV4JLJlf2A7zwrn1aqGwo+ppih
         zz2gFUzzrnhdqIY1VHHDSGQMXbraELoYlPXkWLcaLTMkV/7eVstqthzHLxLj1tK/pzMo
         aJqSHWHykbxG2KTi2G1pxZv2MisnSlVs2B+l+J0G8kajLpGJVolN+Ue4mqkNPJHjchsE
         XdFZudgIGPKSCZ2m8Cka2xedzGrfrB+6bDBhH9Dm7dSs8MjPYMGxm24g67KHqu6S/Lqk
         pyRf+Raz+P67FCtcIo4SO30SDyoyl4PsUtn8at61uxNN4HOff3Jej7tAK1+nyEdgNYBu
         5yLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591240; x=1796196040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l1SQBJPQH32GaCf6i6Hpvj4B1BS4U8Mq3RY+38E+QYU=;
        b=YGourjDL7ZYB3ITzig0gXNfE5/2ixAFzQlvCB4MU38oUQZf2lwHq65KWZwHWeEfdxX
         ObEw2iKp6TmsSwZXR7jQcg/cDR6KDAhrEjcJp22/L0y35nhDjV9w3XwnUg08SgiPa3UU
         O7YVPC52MApwBKsvVhpqpzZo9JIJ3ULM5XbXRwKiqLxnFS4LAgXGrx/4tQLDbCVVKLkK
         SoKpxetR7qKPxQj75FsESo5yTFU2RaID+FMhr1nRGJuMGIpLlKadTIz1LIybOHeIgvif
         vG09CGIpOvq1FI6Xys/IIM7KCRnEitWcKKVQsk8XfUZUuB217S7N7MCh8erFazMDQtEx
         zJ8w==
X-Forwarded-Encrypted: i=1; AL+hErFx0eCSVRPBhMnuO3T/1+gVEi69NMuFIgoWBFsG5x6FigVM8w/pDcx18W+qItn2Kiv+BlLojVA11zCf5oU5aiuX@lists.infradead.org
X-Gm-Message-State: APuU4Z9Vlc/mUY2ZZ6zMbS5W1Jv54KJSqCp2kPO4AiiE48St8wziDFfR
	Vw6utRjsEjjpafGFSQuSCmCVpqb71OsHxxMm4zLOIw4AStJcavIO7YcX
X-Gm-Gg: AZFdTZew4n8kfQo/2GUgeWbNfMer0dtrXIXYrAOFKevlUJLmzaJaSQsEkTWNpivsMRC
	DPAkK2rEJ1Za/qNhNqNbrt3+g9GOb8tkBrj3RRMUHY/ny21ILlvy/spJjwPm5xw6F0U9tMLL/GP
	ictYVUOy9ditrtgHSHozng5Oo2q/KO2ZskF9I3pCXFU4Ohxnozym64fsoEUKkjwSBslTPrwoBV/
	XddA8vJekpi43gmy8SFlyhcmbyjKDgXMRFOeaAiOXXaigyzU5waBOjwJdlr1kp2Avtle5XQtecR
	5wRUX3iIeeRd9JBtXGmCUTc9KLY/+WonZ2GVQajXl/uifctRfspABxbmU0zAkJ4w6kmNSN5b8Go
	h4pQb7smXSe1QaGKihN34HwNmO3qs5My9dhEkXXR2aQiHIgMYjmA6kr9HRDnUsHyaKksk+a4sM4
	i++iPFleZsVDMb7eGxYcxQFYgCHPN3cAYUF33TNmx/d/wywRH2OmyWFUyo3ZNX48r0R1nzKr8p/
	GrI0k/EWVHkcIwbYiKJSsI07x7YRL1K/6ww0rk2T3EfGz+M1PUCA6EyNbqsLMrCU38Rp1sKsBNj
	QrEkTeii0sybqR4422vzvCnb2QNaYwSPwDAWynLWSLk7c6XNXi62hXcHuH3ZQQdc
X-Received: by 2002:a05:693c:6010:b0:385:2057:eb95 with SMTP id 5a478bee46e88-3857073f2a3mr22650185eec.31.1795591239429;
        Tue, 24 Nov 2026 23:20:39 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:20:39 -0800 (PST)
From: Prasanth R <ragaprasanth@gmail.com>
X-Google-Original-From: Prasanth R <prasanth.r@lineo.co.jp>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Paul Cercueil <paul@crapouillou.net>,
	CL Wang <cl634@andestech.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	Prasanth R <ragaprasanth@gmail.com>
Subject: [PATCH 00/12] rtc: clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:20:14 +0900
Message-Id: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_232041_040646_0A0C4122 
X-CRM114-Status: UNSURE (   9.67  )
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
initialized" and returns -EEXIST. For jz4740 and atcrtc100 the probe
then fails.

Switch them to devm_pm_set_wake_irq() and devm_device_init_wakeup(), as
was done for rtc-pl031, rtc-stm32 and others. Patch 3 also fixes an
unbalanced clock disable in the mxc_v2 remove path.

Patch 1 is tested on an i.MX6Q SABRE-SD board by unbinding and binding
the driver through sysfs. The others are compile-tested only (ARM,
clang, W=1).

I used an AI assistant (Claude) to find these and write the changes.

Prasanth R (12):
  rtc: snvs: clear the wake IRQ on unbind
  rtc: mxc: clear the wake IRQ on unbind
  rtc: mxc_v2: fix unbalanced clock disable on remove
  rtc: mxc_v2: clear the wake IRQ on unbind
  rtc: imxdi: clear the wake IRQ on removal
  rtc: da9063: clear the wake IRQ on unbind
  rtc: fsl-ftm-alarm: clear the wake IRQ on unbind
  rtc: jz4740: clear the wake IRQ on unbind
  rtc: atcrtc100: clear the wake IRQ on unbind
  rtc: pcf8523: clear the wake IRQ on unbind
  rtc: pcf85063: clear the wake IRQ on unbind
  rtc: rv8803: clear the wake IRQ on unbind

 drivers/rtc/rtc-atcrtc100.c     | 8 +++-----
 drivers/rtc/rtc-da9063.c        | 4 ++--
 drivers/rtc/rtc-fsl-ftm-alarm.c | 4 ++--
 drivers/rtc/rtc-imxdi.c         | 4 ++--
 drivers/rtc/rtc-jz4740.c        | 4 ++--
 drivers/rtc/rtc-mxc.c           | 4 ++--
 drivers/rtc/rtc-mxc_v2.c        | 6 +++---
 drivers/rtc/rtc-pcf85063.c      | 4 ++--
 drivers/rtc/rtc-pcf8523.c       | 4 ++--
 drivers/rtc/rtc-rv8803.c        | 6 +++---
 drivers/rtc/rtc-snvs.c          | 7 +++++--
 11 files changed, 28 insertions(+), 27 deletions(-)

-- 
2.43.0


