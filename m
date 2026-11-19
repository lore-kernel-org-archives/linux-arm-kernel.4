Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE69C606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 07:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ozn9jxdF;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XwXR/MPk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Gi93IXFGuN2zmaOXOQorfmKdnukVzvkHHvPulF9dWJ8=; b=Ozn9jxdFGHMm/9l10i8bMOPWz5
	/f4CDZ6ut+612KwsriOdnB1DaLUW5+SSTiYWetHU7FuRs5VOh4D+ASzOr4GlFlwG7TYMaSj7KX/NE
	fRa8jn/18TpaSo/4WvgbcpjJ8ghnyyNsx6YVt8ylA5QEgLnDJDo3aKyvkYjJSSPpgyfA3cugvOS2O
	elQwS4LKEv7eN/S4AFCdogC2REUsOPzN+bu6TNAJdEc4nEC/Yi4NSMlXvruVDdy8fW7bZyzw75ez0
	UHTdBPnBU5YAR3jgiqBgIHdl1gJHxx1AxbmGAAj04dw9YugFz2yJgzGwL1oDoo5FYAaR45CmGXeR+
	zNkWancQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwkz-0000000B5v5-3KJE;
	Thu, 19 Nov 2026 07:40:33 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwkv-0000000B5tF-2YtR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 07:40:31 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c4d427836e9so256899466b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 23:40:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795074026; cv=none;
        d=google.com; s=arc-20260327;
        b=EIpOvXMas/bp2WCd1ZlSiwK85lQVd283rLX6mzhX5FxQX3zFDxTZua9tW5XHQRWG9L
         7ypfbIsg08EO9D++GvrcmbINlYSaWVLJUDcAMy8A2qqABStnHlpsBhYR+nuxoHgV3QHk
         glffJTKnXsTXwwvR9qaX2aLlR2OQ3NwdeXHzAhzqiE6LR9/zg+JdeR6o4Gd38yJa4mUs
         fD6viBzaDJY/fvaCTuKLdypZEFAekNDelgsxBIUrzqsna7TYSf1ZK/3YwNSiI3jnV33E
         JY5l7g9jI6bAOBUpZSn1vEJis50oQzkNKnQ1WWac3zyC23rgju4EP1hCtd+Y4qIOU/9j
         DkwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Gi93IXFGuN2zmaOXOQorfmKdnukVzvkHHvPulF9dWJ8=;
        fh=ic8E+wFvVTKVp/BevoDes3EfO/DLoWhebCsWQY/AznU=;
        b=ACejOS1SrhkggCBCfLOGTGuvc4jZME0hxmuQdFjHMtyvtHUNYjY1tKYC+LF7LxsHVC
         b+irU8fMer/ojSyOj2UHSpWFnunLUzwfWs1OzZNIXNKxH8MdFN4+Qj6nfVL3kzCT4tzg
         C9wl4KZzXddcWDeWrMUU7LvEXGNIdTte1Z53uV7MKo3UB89jDk7Bmk/f/53D8HrmLHFC
         xPyqKlLtcTPS82aluk3wyYUB4dK1CICQtABb13tEF5w4KdoefLY3s5/ZETWXj44PQVmf
         45f1AtK0b+NPUPFRllre1EZ8lted8xN73fhSxO4JKjWjJBkv0/tHXsNXHAh2vle7OulJ
         IcCg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795074026; x=1795678826; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gi93IXFGuN2zmaOXOQorfmKdnukVzvkHHvPulF9dWJ8=;
        b=XwXR/MPkf9ZNWZIfv/qzj/g0AN3+cxE8TwwttpdHYkMtKPhE8tyZoGRQZCtMs9mbmM
         Ie1jVPxikAsp1+dVw+nn18AA7b6R9ZLSV1aEaTp9+AgvYQsVzEaRTwsKBN+OIJkyLMyd
         L7t6Zdm0xKr2ANW1e3/GdG/xDThsIWAgcrm76pHYHxlbisZ0EsojGxsAo/w9Otkv6ceq
         p6k4bHw3DhxBLTa+Biqd5VMM9NHPrGrhLNrUqtmfgHmcd5Alj2zjyRcBEM+WhAbg9CmW
         w/5Q2IxTzXIT165/odx+1gxX6WAHN5hzd9RS98ebFRXH3lOEeyCFxvW8ag/d07JzT2C0
         gGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795074026; x=1795678826;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Gi93IXFGuN2zmaOXOQorfmKdnukVzvkHHvPulF9dWJ8=;
        b=TQr2JGUlVpejKQ5wjoxA3l6eWHIjccAh//jTvehFPPp/kkNygk9OTkE9GPMAlDhd2s
         GOANkldeyQIvR9glqVDab58BVgLLNppiDxsCo6R9u3wauR8J07UXe8FU+d1Ko3NKM/47
         xQcQPe3UJN6XHgCKWWeoyb4zUo+1a31UHZ4zTRyEoqns65VIsPvZh6tSEYyMcIT5nWmo
         za+Z1I9/6lR3fc+yd8g53cNB2jPwll3C1Nv5bCG4+UXaXnu6Xdgu2wAXviIlDGYvzJwe
         oK755jenWd220l1nFOzMmn4giwcoIN4k9WjJk2QOYAUABBHTHyy+4XkIVOkz/OvxE8Tw
         5beg==
X-Forwarded-Encrypted: i=1; AL+hErF/L3qfibUjC3AMs7FG+ew/Gijr0v2Ev3anOSujf3/UllJcZtS5/n7azloAh/2VGPjsWuQ34+AwuFR33GIVdpMO@lists.infradead.org
X-Gm-Message-State: APuU4Z8rA68b47JN84iA5gx4lFdlxMRvoibqhhfKzc4hiu26jRWsoL9I
	kANNRNgbz7HDG0XLoG6CzXl62k0shO2HsEl6IzkSVFkELrLdo/lvy8YohBNUHQijseF7EOVh8Ga
	NwLZEJGdyHkI+uNZ6fW+b3TnOlBIuUI8=
X-Gm-Gg: AYBFou1gXjfszyUkK/rGXSXl1PhY5Xa0IunXbBYEsIjWQLM+WL3UZazKt6mi9SjyzpD
	jo+lcSy7sJ8bGIsyRUNiwAaWC2PKCs+El0WB0fH3z44F349oHKAW+Ly1Jx4rIZVtb+7M9jEl0aP
	cwDCZqtWt/Jc/bw+dHl65lUKrpZn9F6Kj288LTGEcZf6oBT0m8yFbHGHD6+PYYL1uCET9BmlgRt
	hJjc0X8o+D7pAHVjmjgmZmdaB9qraq3kqKmyoVAQKNTyN+k5DchFoRQyw90Ai0wbWQ3D27bNLDX
	R6ca0MPukdmWbiCTYfCsYv7UbOiLl7jop+OqyhO7+ieG2wLbThUfU5O0Dmek5wWb9Hnb6Cdhm78
	72TyW6br7YJ23CvMydaKxh5qBOh8lfrehIdaPoA==
X-Received: by 2002:a17:906:9c95:b0:c49:c76f:dad4 with SMTP id
 a640c23a62f3a-c510e31c90bmr479980066b.31.1795074026314; Wed, 18 Nov 2026
 23:40:26 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261117-hwmon-da9091-v1-1-f55f0af9c6a3@gmail.com> <be16d42f-e6bf-45d5-83a8-28afbe54e3f8@roeck-us.net>
In-Reply-To: <be16d42f-e6bf-45d5-83a8-28afbe54e3f8@roeck-us.net>
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Thu, 19 Nov 2026 08:40:14 +0100
X-Gm-Features: AclHuK8v7dApGOktlI0-huzqV5dz05Lcptx7NLQKfF_k22DUFv5_-2WqsvDZTRU
Message-ID: <CAAOJLPFw1f2v14wtJYt9yqJsTiqJNmkm=dOaAHQ+qeH70NgsiA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: add Raspberry Pi DA9091 PMIC driver
To: Guenter Roeck <linux@roeck-us.net>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_234029_680590_91BFAE55 
X-CRM114-Status: GOOD (  11.78  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> >   drivers/hwmon/Kconfig                      |  11 +
> >   drivers/hwmon/Makefile                     |   1 +
> >   drivers/hwmon/raspberrypi-da9091.c         | 339 +++++++++++++++++++++++++++++
>
> This needs to be documented.

Please clarify?

> > +     data->hwmon_dev =
> > +             devm_hwmon_device_register_with_info(dev,
> > +                                                  "da9091", data, &rpi_pmic_chip_info, NULL);
> > +     if (IS_ERR(data->hwmon_dev))
> > +             return PTR_ERR(data->hwmon_dev);
> > +
> > +     platform_set_drvdata(pdev, data);
>
> I do not see where this is used.
It is retrieved in rpi_pmic_read and given to rpi_pmic_update to write
the values to and to put the last_updated variable in

Kind regards
Sander Speetjens

