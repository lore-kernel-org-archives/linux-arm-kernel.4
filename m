Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE8B606A331
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 08:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lC+r0ztN;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jO6INF/3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qfKfJJI7wxhAdDWtpsGEzNb54cWJZYAwY7eIBpXfiDk=; b=lC+r0ztNAHv4uK75cFjuGBCv/b
	ig8tUsxsiHs6Es0/BTpeDIZqVkhmPYh63Xb/n9oM2XRoxeDBzGw5x3YjjAY6yE9RlP9TRdGI8t/7D
	19WqWDc1Tjvl4ZTwe4BOO674WaW7lT1rEp6NvluYVz7B7Fo4M4W6RkD7ALwxKhm/HoixFKGyzuO0E
	GY0ttfJ4UOzfEyXIeLdDQWhFMY9eP/Yls4sBD+JhVTpeE097wLph8w2LU2rgwmBsLjxd4nsceyP0I
	rBCkcS6x5kw6Eswz+hc4hht1gR2p5sGl3d/SG6mgiI9XzR6NYIEuXXMhK1X6Lq8oGEEQL1MLMIgWl
	aDNn6Kbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmWd-0000000C0jN-1oTo;
	Fri, 13 Nov 2026 08:20:47 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmWW-0000000C0hA-3wN3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 08:20:45 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-3ad3ef75223so942101fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 00:20:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794558039; cv=none;
        d=google.com; s=arc-20260327;
        b=euuoqSzREKHIFRFCZ97bjSzsMSKF0sma9oyNcHg46erFQi9POuLiVfXM2eY/VOnqc7
         NIRk+KWIO5uNP1kAIxHBNwKHdB8LsbBnRI+hXOyM6Wxcon6JnCs1OMcbiGDyBRjArxOL
         LlSuAzxQgLA5ohNandVzSxYyz4EBmjdFF79ihBIJra8WH1xpo7ZNQRsHKi4PSYMNmnXl
         R5wxaWLGy+PL3522EcUjdnWJIXhWcPC0PKKl0zruk7Yti7d8vqjIq8JyuLUPkEqiYSfh
         a4VIbcpE0RFfufzDqHbRvNW9MbsHrh/bBlQwTimOuymcBuV+bbVnpeSTbe6DEKNjiKIv
         Cw/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qfKfJJI7wxhAdDWtpsGEzNb54cWJZYAwY7eIBpXfiDk=;
        fh=RMIr8C8jioU64ExS5eTas9kR4qnC949XIGzPVEZbsPE=;
        b=ZbW9yp30c/qy2TD0T8x3868E9XEuNkzjqMUyuNmH8oxHVU1tDL5HwwVLgpZSew1Xhu
         r3Wm0GgWV752wNuA7vCqCF9UqxTWnMg6SH6XbPsTg7wIJF2nKlHsvS8HtX/mN69iJvzN
         80OPaK8S6fUvZyUzcNiGabPHUAAVVRlvL5/BvbYYj4MxZy4Jrjr16XObczMtn6MaSaqn
         KyxLrVIoTRm9jB0W4hJ812dnPKO6JI1MpOHIS6Vv2qyZiBJYL/Z4cW8T4x9iSN0fkSoB
         5ccxsd3hHbEKr3REkAiwXXvMmZpwik0s8bwsttrFMUr1xfi70bXjE3bw8BL2EwOzxKSO
         JclA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794558039; x=1795162839; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qfKfJJI7wxhAdDWtpsGEzNb54cWJZYAwY7eIBpXfiDk=;
        b=jO6INF/3/kqg02oMqn374kRS74DvTC4ukXAM+1vd15getnQXAKOLaUg+xE1d5q4p0w
         LhiHXRRkmU0vdlzOKGtVF6sIXiu5xg20BWdsW5d5Mx3SqQe/0JeLJJOeOZXXSVVdBWmW
         4rtz0iykdI938LfqLIwrOxI5DXVr3BvMwn/9gY+jjjQ/Qa98e5ZqlCUe5BqqXTSpb/FG
         uGhzSZa+4vFlxVfKu95jjK+qkvy++lQJLX2EGgPe1fr3aWq3r+W/uARZBjVR4bfMI8bV
         ZDbXqwU0clQ42ZvaTAao2a1vMBCZq8ZduFRROxxJJed8e/oVb/WhsUErTN1ohnqQbvMt
         RSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558039; x=1795162839;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qfKfJJI7wxhAdDWtpsGEzNb54cWJZYAwY7eIBpXfiDk=;
        b=QGYegmuN568QXQz3RGwUf4/2HhOyd8D0id08Va1GOLFpyGC3YtPoUKPXdiKQzLf1BA
         /vfrVkEhuJdkWir7yyY7kXO+i6mKUT9GiNOXE8Xeru0z6yPwflHKLn0o8k0J9Q+tcVga
         BHY7xYTjrh9IPp16TdII0S3Qo5XdCT/4aT8l7y0AH7OX9LG7wmspPi07RWknVJotJo6R
         1N7FArRDnSA8d6qM8UOm28DbyTjRR8dkklWg9zAfOdYvE0ARV1xPFpLuAjNyF9Y9Wqxz
         Hvd0FqWYDuQ+HrVFpRUR6v82PI2qdCZoYxoUElyLMUYyfx1jLzLSUh5OiAxGI3w2XbX8
         XfyQ==
X-Forwarded-Encrypted: i=1; AL+hErGedWSr8zuYW4KPMf7Alv7owXNxL1rL2m35JswE4Ksib5X57FKTYva+qkmZI2gqYA35hjjCvIu6A+IJc15sTyq9@lists.infradead.org
X-Gm-Message-State: APuU4Z+k/55CdZmLlHyx/dvhWRI9RTHzjOshIqebkn9Az+cUMt2m424w
	7jyfxC2ewr+BSkB3IyanDnueHj8RfMp+XOG1x6CWs0vwBaHk8jPLga230RO6ecmlenVF1bu5eG+
	lKLzJN64QeoibvyMtvIJsVMUyrrZ0Muk=
X-Gm-Gg: AYBFou0cWxNBjc+kNG9zCxmesibU6UsEI5eQTHCjr2iTGl6yOjJFnqnhnbzpDbsBH1W
	Rwm8vWG8nImv6N9Dnxh9QrapYLAtcw+fcn5DfkCn4xKFikX4UlzDwUJXnZq6RjtloSG1P9HQLeC
	SxYS8KKcoiZjviBzqyo+0xIAYhFdhdR4eDqz2r916ByyLlGxYirYOiJaghLIvBP1U67VVLidAK5
	mQGXxDI5YFcbd+yulz7AYQrbIKit5qkTaM7hsne1OkUSYi4el8HswnlC2YCw/ewjtIDax7/O6SQ
	ZtLCaUSl93xTawP2jgB3mrfGCT49VRWS5s6IwbyHXv4tn4ZgHJPzmXWKgVyj0VK/nsE45ReRL6U
	JVgemsrNlc51tXMYZ/ZhSHJ2E/b+0igLibjGIK73s4QweIP6h7ikfP92PlZKuEUmhhu3nGHE=
X-Received: by 2002:a05:6512:3e0d:b0:5bf:a66f:e5e with SMTP id
 2adb3069b0e04-5c17058b108mr849129e87.0.1794558038625; Fri, 13 Nov 2026
 00:20:38 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110-usb-port-pairing-v1-0-9307e29d2ed2@gmail.com>
 <20261110-usb-port-pairing-v1-1-9307e29d2ed2@gmail.com> <CAGb2v65goAuKgYu-849171FGeCxZ8Cq3GUxQLDLaHLbhRTMmqA@mail.gmail.com>
 <CAEy9hNV9saBWyKxuMR5unmLjzBM2+S7u+FewEevuLV-6yo1ztw@mail.gmail.com> <CAGb2v64xjbc2t+fMegBUSptiwT5FQBqc8aqiVkLjwfaB+3FV0A@mail.gmail.com>
In-Reply-To: <CAGb2v64xjbc2t+fMegBUSptiwT5FQBqc8aqiVkLjwfaB+3FV0A@mail.gmail.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Fri, 13 Nov 2026 00:20:26 -0800
X-Gm-Features: AclHuK8fPl6O1DLxtbIbOB_Tvsw2cAGJCYYC3mBqm8ET2-FLO8BbsLPv08rZzEo
Message-ID: <CAEy9hNXErDHYorhMp+xVz-A1tYs7JSEdFYApCK5AO1nMAFDqCA@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: usb: generic-ehci: Allow describing the
 root hub ports
To: wens@kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_002041_574811_8A157ED4 
X-CRM114-Status: GOOD (  10.83  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> It should definitely use the raw port number, since that is what is
> supposed to be used in DT (and what is used in ACPI).

Thanks. v2 crossed with your mail; v3 will use the raw port number.

> FWIW I'm also pushing a series to wire up USB on M.2 connectors [1].
> That also has some code that does OF graph lookup.

I'll look at it for v3 and reuse what fits.

Arun

