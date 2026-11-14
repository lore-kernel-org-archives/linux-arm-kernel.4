Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D7F606A894
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mcuZlyMQ;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Q1saTVHS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mvU1kpigz/fcmORnKiiTtGBCSmbqbtXn9lCfHY9BiQA=; b=mcuZlyMQscGSGo
	QZ5bf1kWgub+ohQDShKDgrgybQQe67V8WHIfapo71QyAP9lBK4L0vNfd/nMHW7PWw/od2tEB1MVVw
	Tg25khyVVF2u9KYzuO/vFTrzNytBnLhhpSwH/gZ177GJryyEJ8Lc3lMiLr6j8Vrx9PddvAHHMm3V2
	XQMM7F39HhCc3fEJ52XczsdsKKGRsLqNO0sQh6u9Y0kgLXeK0pZi+f4+kuc8Ps356b1l1rSzrOdoK
	QXbOPaJRa7uebRJ2GEtWays6YBw7rKEHfhYop1A7O0/Tv58bt+WIRi5WhCDAZN5tWRxExqweloUDR
	WgGNv2dfqt+5tYzRFvQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4QA-0000000FFy5-20DS;
	Sat, 14 Nov 2026 03:27:18 +0000
Received: from mail-qt1-x862.google.com ([2607:f8b0:4864:20::862])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4Q8-0000000FFwL-03t3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:27:17 +0000
Received: by mail-qt1-x862.google.com with SMTP id d75a77b69052e-5364d86f7f0so37701371cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:27:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626834; x=1795231634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mvU1kpigz/fcmORnKiiTtGBCSmbqbtXn9lCfHY9BiQA=;
        b=2Fbax1/Ay+aD9nm/BVCz5g3oLCTl6bXDYgCNL0sIG8J1loJ4znuNM2FLHkdr6jzxXS
         cXxxz6pXJlL0G7RNMZS9MkKi0k5fjg8wOQ6kmEsPLTVuqVlEcz7OZo5NfCHNzUhEjC15
         RK4xV9jv/rHqoTknFM7Fu5KV77wKfQn1Ermc3p4JtMkiLn4Ifribr0WmGTDbJVnmg7HF
         Yj2wZV+XzA7x4w/nRPjMin/aXNMlmsoQ2b6inYiF4VkB+UCHG5lGMjiSsW6ykL7n6AaX
         beRqTcf8OflmRocJ9fi7+OkcwHwKjyTdHUkzmriwrAETn2JSVNnzf4UH0zGCfBGux8hN
         CTwA==
X-Forwarded-Encrypted: i=1; AL+hErFnsiOi6XGd+/aFWuVeVwoEenF7b7HmiOxCccINOR1Yx+L0/udIpOWhgwTNuzYaR1Zp2TsEtrphIp/EYZxskRkX@lists.infradead.org
X-Gm-Message-State: APuU4Z96Fe51OMISiRZK/sITontVOAaRB5VpjV6woZzbM65mpOCRsMAh
	atnyIo6Exx7xDy2WbQat5yFHD3Kq/XLyirmaN8F/RHdNOW7xy/b1kn8M54mX3oj+9iGoEi5MrEW
	ArkUe9a1ag3nJs4jXd4nrFkdQKvH8YXWM7DtTBGTP5UPLX9O4mM6t47xcuxnVJe98gzDninVi9n
	NnXiARN7mEOtOEzJdVK+IQh3z5fw5T7GjH1D1M3y+twV4VSJdrrMloLvkqHl+UAJdwdrxzHejey
	0Pdu6cLG1t+2Z4hAm4RoEul5iEu5Q9Zp5Y=
X-Gm-Gg: AYBFou2PXY8yRiG7Pwe/iL02BFsLbnXrXK3x4T/mwyL0/sUMNg6TwQEMNBdZTGFKSI+
	w+VomD8x/6SeWShr7202OmVawAMeZ5X9HrGIywEGZyXozFcNrSkFcyPgHciblF9PKWodSD7Adxh
	0nyXY/sGGm3ikpFM4bqMSYDKoKXGP8bHRauECSVtY+kXxTq3yoY9savfiMV8pVOsUU0KkVC953a
	/V3CU30La3GBDj5VURbiiqEWrvA9dklnFZTHK3/g3JpI4EHGoVmy9TG6q2uqjxnLJOOHzcL6MFV
	qVxqG+QE5VHa2CASdykswYM8qwnCY+NNrCsy/725qgAg0LVEnk7T7fq83ONKAAFZU0x2v4XdxOw
	d/IjbJe/Lm4RxIZysK/3aLcHt7yL6QMNgdyMqmggqxBZpUrXmPiqrs0JOVCZdmK4hPL5iVN4rAH
	f0a54XPoerINodnWFjj6ah8dq2CWE8lUFfA3yrBev8
X-Received: by 2002:a05:622a:1390:b0:55c:ae0e:fc91 with SMTP id d75a77b69052e-55cae0f07ffmr4097341cf.60.1794626834617;
        Fri, 13 Nov 2026 19:27:14 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-55ad11f75dcsm1229431cf.18.2026.11.13.19.27.14
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:27:14 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a3451ea93so1658492eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626833; x=1795231633; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mvU1kpigz/fcmORnKiiTtGBCSmbqbtXn9lCfHY9BiQA=;
        b=Q1saTVHSi+h7/AWl+5mhR/mJXMqDZzSCLufLMYaubVwMyVJRyAbn/uLL59yAByBLze
         DnmB7OdvR85zbaj5YnbB9AObuKGRAlfxbvrxzeySPb6ksUw4/IYgpec2YhNDPkYDuzVw
         7gFJ3rs4H0Ufh0dit7NCjKnYsqotSGl6QBuho=
X-Forwarded-Encrypted: i=1; AL+hErFttIy22/knKA721J1efIViymZ6mJfI3qmvMkUCtsse3BR2UMCelQYOiX92Ys1QVkcNrrf3VieaU+XcPXDgKIFI@lists.infradead.org
X-Received: by 2002:a05:7300:c88:b0:36d:7f5f:7e97 with SMTP id 5a478bee46e88-37967dd734emr5998532eec.40.1794626833054;
        Fri, 13 Nov 2026 19:27:13 -0800 (PST)
X-Received: by 2002:a05:7300:c88:b0:36d:7f5f:7e97 with SMTP id 5a478bee46e88-37967dd734emr5998462eec.40.1794626832269;
        Fri, 13 Nov 2026 19:27:12 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad134sm14228212eec.27.2026.11.13.19.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:27:11 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/5] firmware: raspberrypi: reorder rpi_firmware_property_tag enum
Date: Fri, 13 Nov 2026 19:27:10 -0800
Message-ID: <20261114032710.874144-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110-rpi-tryboot-v6-1-56f680ef4734@linutronix.de>
References: <20261110-rpi-tryboot-v6-0-56f680ef4734@linutronix.de> <20261110-rpi-tryboot-v6-1-56f680ef4734@linutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_192716_060847_A1DFCB31 
X-CRM114-Status: UNSURE (   9.25  )
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

On Tue, 10 Nov 2026 14:00:11 +0100, Gregor Herburger <gregor.herburger@linutronix.de> wrote:
> The enum was once ordered by tag values. The later added tags were added
> in a different order. Reorder the tags again.
> 
> No functional change intended.
> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian

