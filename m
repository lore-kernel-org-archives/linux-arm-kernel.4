Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2ABD606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 02:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=quk5/ho4;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xvJNzEVM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qRNJo2Wq+atj6dWEhKZftfAsf0NVsAUajmV6VEgSNV0=; b=quk5/ho4iHAIE8
	YOTnOHfFgDeD54QWBM4+kxPkoq7Hw0HeJoUzhUVX3HA0mkJ25EloxtcwqmKV1iQcvEy8nDPeiyHgh
	WxIy3pG2kEFPLNfjkRAp92jjMjsbFlbs0WR6hGQli+JhnwzSrTn8jCuZBntjhCw2wcwfh46OHkwmF
	WB4rj3ua9efB9T7A4E+nm2kDiCxFWH30bVE2DSAmIcbxLlT7m/rHV7oTELg1XmpLS+hTZwiQM8rrJ
	DObsRxGv6ASZ0lrPsEInouxvjVmvbAPuijSO+bQI/I8Ke1d46cZKCP8OezotyKDzCpxI6lGVho8Ol
	GnhcX73DdmajVgsj1vqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWlg8-0000000EmKv-20p7;
	Fri, 27 Nov 2026 02:27:12 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWlg6-0000000EmKJ-2aUg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 02:27:11 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-ccca948203aso5355240a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 18:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795746430; x=1796351230; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRNJo2Wq+atj6dWEhKZftfAsf0NVsAUajmV6VEgSNV0=;
        b=xvJNzEVMhtAem3GNHUKO4uHTqhFiC82Me2Drl/zbETL9zDGgZGg7eZV912oFaeVW4N
         SSzqx8Cw/HuPu9g0D+pAyf46R3fTuivMdVh3zErpyqyx+cn0lvtwKEUn761a9rGIqf24
         keV5+gXWk8ISPJDqddQ7/CaL1oVmWdVqnjXAQasZC8tz44yXFMAUx4fbAUuNSo6NlDdT
         I0QLF4TvmQCKkmJj40gj1lG35nn9FpvVWXm7JTESgSRc5gJFvRard+yxjrY3FPTIFsar
         m3LgsX3EErFpZZUIWmdGgbSP4ivsv2ZA6DHxUk/tbhPyu4DWj8eNJ8wsnuroWDz0bwC8
         mpIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795746430; x=1796351230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qRNJo2Wq+atj6dWEhKZftfAsf0NVsAUajmV6VEgSNV0=;
        b=jRdjgAwiHNIpe6zgvid3pTgiQDe4D8v1XRFLnqsvLEDIzpWaPqbGrZXB5nsD57FZDk
         gOG8ZZt+/Chcdd/fCguKw7w4W5qbWrspb9xE+XtEhuMlnyvgF3Cz0rI10ByKF0GNzM7x
         OSxdBS4Tv/kXnAVgvhMvuOwvp3aVsf4RxEXx00IAKEjq0O+Rgv6rMsKtQgeWILUL4Q5u
         rtJQnSZKGglg6HsGYHqbNG2o6G63iG2Jk18vEWwxdJ8NKDy9AxUm5pfrWr2ILwA9LRtT
         m0oJktq8NhQchAwJ/woitumKEvTFjZSE5AYXF0/4dXf82+ieTu/iBh5qzBzwaPbWEjut
         QtYw==
X-Forwarded-Encrypted: i=1; AL+hErEsVQQq9MiA9j8z10Ntwpme+mwvpY/fw+jHD6zQFzlCMDDnLtiInR/us2rFICwamcBok6xbDOOEG4qJ8Bd2PRBy@lists.infradead.org
X-Gm-Message-State: APuU4Z/n1JPcPWyeJgXCUqGw/gEufqanykhcTyMuPYJ6QMD2t05ktWbD
	8Ju+njhn2ASFL8P8sjsBd4zcpySR+7s4NLmitdLGBcUOAjzU/Ax20p3v
X-Gm-Gg: AZFdTZfmtSMAJV68yM43NSA5Kr89mQULbbSGCdf6CYk2CxJ5hU0TPe40Q6E6wnPftNf
	FeLyxnItM64Mtl1rsGXrq3U3WNmBV4Nc7/9qlVH6OuzZVn66LAbD44THODWmjAje+dsl2jpjeiG
	M+Nlv+BDaZ819uylhuhiIPtqLmoz022ZzToAZPTvZNTC1GEPdyzyDg4cwxnNIgbZ2FgiANY0r4q
	aUpB+vEVO2+jnt8T7gJClFvAHM9qjHJeuTR6eGS8TXZLq4krHfr8gkaxFj8Z7OEazaRlSd/kqj7
	f7PErR+qepdkjVxj7xFbJu+gJhRvhuYGCd7sEwit3YcLMZVMHvACTzS2kR49nvo3HUs1WLWDk8o
	EhYQ4XnTO/AjolVopRrasF5wE0gzor6aqKUsZDG+8mLVDCzV5HqGQmHT6rfoaQ9dPZWajJ6nO84
	xAIqYYF8TwDpafCUgIkOFmzaJJhinCsGLrEh3As2uvS7BtZRg1tRYIDwrP9/JXR6YIrt3zaC7XT
	aL0rEVGt9oOneTwyrIafPQhQ6vXcHjJXQRLuiNZ8f/R5p4gLQfy7edJWJQ7Vg5Qu7htCybLrXsR
	l/qm2zLDc43SKZvCx/Ihc9jLpFUix0SpAnocs1SHRB3sOMtcOFvzFbnK3zY7RDjw9szb8yNRw4L
	Xgz5S+r8=
X-Received: by 2002:a17:90b:164a:b0:3b5:a3:442f with SMTP id 98e67ed59e1d1-3b500a34654mr6199205a91.41.1795746429680;
        Thu, 26 Nov 2026 18:27:09 -0800 (PST)
Received: from DESKTOP-TPPBPA1 (36-229-10-180.dynamic-ip.hinet.net. [36.229.10.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b82e624sm15560039a91.4.2026.11.26.18.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:27:09 -0800 (PST)
From: Roy <rongh7426@gmail.com>
To: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: pisp_be: Propagate platform_get_irq() errors
Date: Fri, 27 Nov 2026 10:27:04 +0800
Message-ID: <20261127022704.685043-1-rongh7426@gmail.com>
X-Mailer: git-send-email 2.51.1.windows.1
In-Reply-To: <20260630123452.14226-1-ahmisaranrao@gmail.com>
References: <20260630123452.14226-1-ahmisaranrao@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_182710_679003_EDE0B89D 
X-CRM114-Status: UNSURE (   8.97  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 30 Jun 2026 18:04:52 +0530, Narasimharao Vadlamudi wrote:
> Return the error from platform_get_irq() directly.

I tested this on a Raspberry Pi 5 (Raspberry Pi OS kernel 6.18.39),
together with the other two pending pisp_be probe/prepare fixes
("Initialize lock before requesting IRQ" and "check configuration
buffer CPU mappings"), by rebuilding the pisp_be module.

The driver probes normally, unloading and reloading the module 20 times
works, v4l2-compliance -m on the pispbe media device passes 400/400
before and after the reloads, and there are no new kernel messages. I
couldn't exercise the platform_get_irq() error path itself.

Tested-by: Roy <rongh7426@gmail.com>

