Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C92606B7C8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 00:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Eiozi8We;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UyVuXm4d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0LgSlrMVwLd8foBqyEbXINOm3lQXBanGSAr9ob4I3Tg=; b=Eiozi8Wel6Fi3/
	Q/ksWh1yvxQoBb5PAL28VYYrsMyLwYRFxH8lZx7SDWDrva4VqpZRoDuUIjuWmue7OBC1RRCPs+4Rf
	GlqrHFZ2u5KkBhHp3+/jI+ChpWASbSEkyv52GfbjMUIHDZX/SVa6cFWGSHM3k/+EwvxPPioxk8IhY
	80618cKpuKPrlbYALQipuM+zaZLFataY8lbuL6CyOnSkslRai4wJfOFeF0dtErrKPm0/8TWfSGr8N
	ZhWcdiGI2Fhs1wmR3nL4Zbas3wsrqaLSfKdmMHIEQ1l7+2Q5DIIWlqVzY9U3eetx4ZsH+BxlrsDBe
	vgryhkzxYN6YbX84c3MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfJP-0000000BLyq-0ipq;
	Fri, 13 Nov 2026 00:38:39 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfJK-0000000BLw2-3Nhp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 00:38:35 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so4981595e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530313; x=1795135113; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0LgSlrMVwLd8foBqyEbXINOm3lQXBanGSAr9ob4I3Tg=;
        b=UyVuXm4dyD/fWChsKmvJPEuavxQ9TNR9k47E9PQGD6rapT9qASwAXuNBsM6y/nRZDX
         4N/eWIR1x0BazJM/QegjAil6nT6xwkrB/k/I2Cfx4q3tTuMP/3wmrK4zPYMU88k+pd2I
         usX0Uif28jLARBF0qfSreKnr97MC96B8RaplBDWrHqblpNDfIQ1CjPmBr2ur2hGTr+SG
         Diy2i/igR/phWA3SBV3Hsyx0AT5pPKEIGpogTfUn2bJnX471eqr63eh99FNVGzh2leiI
         42VB8Y+uuUKe52DNIFlAuPtA8fLD1bWw/QRBRSgbcMQ2vcaG3dbx2J7Ow8fsbUqw+dye
         lp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530313; x=1795135113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0LgSlrMVwLd8foBqyEbXINOm3lQXBanGSAr9ob4I3Tg=;
        b=cZYIQmlHPf1srRx6G8oz9/93wX3Gp0CytraCVjMnL2lfZvn8+6fpll9kA+0cJRzM3V
         2052y738PUT5PMv7HCBd+UoJ/+NKE1PdxqOLjJlgnkTuKrBmqjOltppEgP9hjWRkUvgS
         piiRVF6UKFTuokla914KCoe4QS96w9kszWZdPBm3b0EB2Ss1qeYIkLIrGINAXhDIVWdy
         KJxO952rMt+OJ/uPWNuwHgj6c4UoRfqGh7dDjI8xUSpYqZMBkSTDaiAH0/YH1wophaYc
         gZOscc1uvOPrs1IRoLH5FjvaMyJxGvLeq0tQOE2VBOvb8PHRbQP6Y0ETXpTwENp/2Wlc
         CvOw==
X-Gm-Message-State: APuU4Z/LcZTY6LWFjjQQ5hiE1odNiDdeEzFghmGCNOkToCtFrkWzUk4x
	5DON9iv8K36uv27+uKXKwM2Y6js1Tk7T29Ol0VTMUURC/3NkdBc1qUbs
X-Gm-Gg: AYBFou1zw/16iwIaEkuVNzpLacsct2ERH38S6Elihp5LVyHx5/pOMah/FhzNkG1hUCR
	Dx0IB/9IizxEoY0LWJ/eLBuYHk1ngmYufHQgcp1brnEyq5P1tSMTGV+ukjXcu/DIo/gXv7t85Vv
	JF4ekhC4+PLNmmuOXW7+VdGbhi2MT+buOLq7YpP1tXD0YqIECuWG5Rz652FdHZYsqwP4zxCcghK
	V1IC99zzsUyG8e96HmIlof1YkQmXoqdabZmKiCpqXCYK6q7/mZ2t+9JdjfuS/wlwu8/kpXysKbw
	XThjgFMFn2lzbr75ta3S1u4AdQG+dwYQXTqEkrSk7J1NxZQK3DMxvXGzRDR578JYIAACoj5IqIR
	mJoHGqrfi5JgompDvYDy+4m7Ycj4r3NVr/SJljlAzPp7iBkbFeEX4XWtjooP2OT+Ms+rHtmGZNp
	c77cJtXGAlg4KxwbenkwcsIgkuBysILOz0FF8eHy0wosU0eQLNnSHsMW482vstEOH/Czg5o+J0i
	Sv/XPrG9BWjmlJ3xX7hTXIAuIkPAC63fyaoQfifTLJFzXx2BqPuDYROBOzMJxX0YFVrevv9PuSn
	NYuyYUCvBVWt1WR8KGmI16fWJdp7tOeObtKX+KPyOeRBDQ1kKVgclH4K+aK0xcW/Y2C3klriP8s
	yHI+ZVmYTZGhqvwrHDMkOI3KnCF8YjDMgf1549soSOF8F2infEPZzs7QrDRcV2O6+bss+OT91FV
	agF0gAlvxpk14Eeiu/
X-Received: by 2002:a05:600d:82e8:b0:4a1:fa21:fd90 with SMTP id 5b1f17b1804b1-4bb55a4496fmr16979925e9.9.1794530313034;
        Thu, 12 Nov 2026 16:38:33 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55afb6absm20185505e9.15.2026.11.12.16.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:38:32 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 22/24] usb: dwc3: generic-plat: Add ZTE ZX279128S
Date: Fri, 13 Nov 2026 00:38:31 +0000
Message-ID: <20261113003831.3671192-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <aup_2nJhE243HVAN@vbox>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-23-ghahramani.navid@gmail.com> <aup_2nJhE243HVAN@vbox>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163834_861905_0D2AF820 
X-CRM114-Status: UNSURE (   8.64  )
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

Hi Thinh,

Thinh Nguyen wrote:
> This driver now supports many different platforms, not just SpacemiT and
> ZTE. If you change the description here, please keep it generic.
> Otherwise, drop this.

Thanks, I will drop the Kconfig change. The USB patches will come later
as their own series, after the base support for this SoC is merged.

Best regards,
Navid

