Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A40E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 07:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0j4T2sGv;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iBEmtcSV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=06mx7f1gORAe7RxT0Hl/EBeglXXoMbIOZN2VJUQnHLc=; b=0j4T2sGvQpzRHwEpu53PUgN2FN
	VQuz83wUoGmwM5k+nrhty/M1Cv8utsnkHHW09filLkEo9+iW94uxZ52qp2NEXlqPxvK1vVN5FaJym
	7Fbv/kMw8TDSQkoVxF3J5ung0x++rgCtn5E4IfUj7NxXJn4m94HJrpKl0WWUTkVaum5AS/3QD1yyr
	RG0B6vTFVSZQhd1kNaHBnQ6mnhb/oz6u/MkTgSVSwwg+D8XyYP9ETLj8IAfQMaQ7xFpztwv4gLk6k
	EazPbGvALqHWFZLurjMll11QcBa+dmETo7JPhpKE3QLmt+SEhmCprS/jPinBk+pzdO6yA+z3k785S
	NCur2ACg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRm3l-0000000BwlI-2hLF;
	Fri, 13 Nov 2026 07:50:57 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRm3j-0000000BwkS-0PIw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 07:50:56 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5c09e2ed679so59844e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 23:50:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794556253; cv=none;
        d=google.com; s=arc-20260327;
        b=IJhd4UaKEeOOv2xcHdIRMbTHy7uL7Xw4rUTmkasuv+7Cc+QtLApsKyX1TqlIlstSas
         FGwRvdTHuUtIBms42BVGkUnDGr5wGIGg+dxeoeD5uBZxJ/pr/T62N9PQhnlwRgCk8Ky3
         mlymDuq0Z0TwSRRs/E1PgqhzDwBDvUqWKc9feAYiJqkWpLRaEdWoNUBvAh7owbhGNDyx
         6O91/OjH9oBWsI01VZwVrJp25L1ekcjyYMvFnhKEF7RkdRWQG3RNXEL40CkZmQLgXLPT
         Dv0ykfoNPFFcQMfwabdz2ZvvmkUP2tVBvQfFv36tN0YKE2s1btPwMpq/2p4L0wFY0Nr9
         +KbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=06mx7f1gORAe7RxT0Hl/EBeglXXoMbIOZN2VJUQnHLc=;
        fh=BA5u73aC1BixRI97F5Ix8mwYcmnvijHk1kJruH9iJt0=;
        b=Tt1+boD2vDSsbh01lLD86aQZRlfdYo5vmzGsyBmHlUpyR6Jbn4991SSS+z31pyIKWO
         98nvaNlkXQb3Kj7+Il1bWtU2Ln7r/FqztVRywI4iKyUwgfBn/JrVeq68aWwjRPqtWlrf
         NyDfIXwS8BrS3odNdD9MBrhIVPAppQFu/Bd9Lhvq6uxr0XBSmv6xao8IFyrsNe6fxOdO
         GiYOdr/cLvFE63iXN//O+jZYCaYzDtSyqnFJnfHJ8vfE3NYQEZGqMuLcBUT7NyfnQcjp
         Bu4RmAL78ADiammztY3eBgFN8PcwCgaTwCWieZKgCWEcOuAAMFd1EuT8Jeq5/M2jAJwl
         2jgA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794556253; x=1795161053; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=06mx7f1gORAe7RxT0Hl/EBeglXXoMbIOZN2VJUQnHLc=;
        b=iBEmtcSVbifvyqfEIxcOT3NDYzqi1jECJw+cEt7fj7GDq/OGEUDQlIu0SIH+9MU6+X
         cqVXDW/YwPO8s76YCdjioeydzIF9dM+vrhfxCS+ZyfF1ySpisBGpjaUi6LrN+2FikRK2
         Pqog8hPppeJXlJUhZ9/RUXuHuMx4kAjYH0vXwasxi48kjq2u9bFCnifSu3sedDNcLtRQ
         XzxYEM/+cCWaIG7AqKnggEYxyRM7beq/whnkjZ+huynroLVinWhqoi3YD73rgS8kP7QH
         CIlJ71BBGbRqQHyp/sBKtiRBP8dqsJ/NTG6tCXjlyCKuKMUIkafwMV5jHa8MAEuwePng
         F1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556253; x=1795161053;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=06mx7f1gORAe7RxT0Hl/EBeglXXoMbIOZN2VJUQnHLc=;
        b=BLH5C/sj8AHjDxkNn/Ep+gyRcVmLJ44GxDYJYxZq/dwVIqLT8QK1ynWb8lFPlRonYq
         3BPk7pNGHoTeb58dw4d1qRtJEJVat2APY8wFZ86eLaqAbz0vjdEwWL9hKBmIcQTMGLOa
         NJvvx20QURxWcVgj3DclBXDtukGGlwEkk2U3sScEs9QrFs+/Ej4rQTW4Zi/XSJUMkT23
         OhUReabVWBuH4hvWK5xpnAbD/Taad2bedrhAAepF3Y/2w+wObZgiNRgduY0W2FyU8xqW
         +EzdM94pfgPdTe8EJw30XDxxSltscpeLn3n9FQgNH5iQ9kTQ8Bxv1+kOi46Nr2ndZsqB
         jWJw==
X-Forwarded-Encrypted: i=1; AL+hErHwSVMZkjMRsHeUQvLhbRKyN/nV8BmssUZ6fnNe+zsTdSW/SAxuMevRRGl6N1v/OB7xjT7lZ/5AZ2miUpNQwvtH@lists.infradead.org
X-Gm-Message-State: APuU4Z+JA0JYaEKqbQJwutjiCvPmNrwO9sq6ipjhnH8NSFgnDc3LRW3Y
	F14Fh+VhZ+PU2ReYfay6uv7txkrhs8ckydenzYZiG+mWokaNw3y9XMuJ4z5B8jokZe6WZS4QMNU
	N2S5sEFr4zEH0XoBXpXZ1rHE16vSbFP0=
X-Gm-Gg: AYBFou28d6y3gAootVAha+C5GbIB9rsm/BVCUiMTIOKzfOcSUWtvAoIWjQdSmQ6fsDB
	3Cjw5lDOlCUbbOQdRCZsllpSAh7edkYjqOjVkTbf8KhYUvMSTz4yV02f/M0c1p8/7GOXe9Xa5ff
	f5CXbWNXIuixV8LaRr/a/O69nobGqRabHGGXKy9bd7if0C5iRrCNApSSYT7smj1ZmaCU74L3e9V
	zXZ8L2BrBsBkZswnOr9KsXAEPf4phMDEtFYCnEc3RxrvX3vuOQhcO4pqqskC3lSDk1v/3n9Dd8G
	EvYO/LRHdgZn3Me8GugjIgVYSlGq3HjJ39PY5wPSyPdy/k/DPo9zjhboA7bKPLeFrnZIh6UKPCy
	TJV93G/BO9PCvaIZac6+J8rPYkRPB3OacNbt5+hhADg5DN7YFaWDSO8UK8eplNo7c0yqw8kk=
X-Received: by 2002:a05:6512:ba4:b0:5c0:da9:407b with SMTP id
 2adb3069b0e04-5c1709e32a4mr633075e87.5.1794556252985; Thu, 12 Nov 2026
 23:50:52 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112-pmdomain-rockchip-v2-0-5cd942a23df7@gmail.com>
 <20261112-pmdomain-rockchip-v2-2-5cd942a23df7@gmail.com> <avWae91pfLv9vyUv@pie>
In-Reply-To: <avWae91pfLv9vyUv@pie>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 12 Nov 2026 23:50:41 -0800
X-Gm-Features: AclHuK9R5vFq7A0lmUNr9gzLMEUVHuewMGfBUZJVlzYHcBuFsoRJP4Ryjr6ab8U
Message-ID: <CAEy9hNW0sZBBdRz-LmydcnvnAwcn0TY+DmpsNaRamPY1mVpdBA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pmdomain: rockchip: report domain errors once,
 with dev_err_probe()
To: Yao Zi <me@ziyao.cc>
Cc: Ulf Hansson <ulfh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Shawn Lin <shawn.lin@rock-chips.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Kevin Hilman <khilman@linaro.org>, 
	Caesar Wang <wxt@rock-chips.com>, Elaine Zhang <zhangqing@rock-chips.com>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Igor Pecovnik <igor@armbian.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_235055_158968_36791DA7 
X-CRM114-Status: GOOD (  10.65  )
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

> These look like code clean-up instead of fixes, thus should be split
> into a separate patch, especially when we probably want to backport the
> real fixes. This applies for many places below.

v3 will split it into the fix (quiet probe deferral, the pm_qos regmap
error keeps its own code) and a separate clean-up with the remaining
dev_err_probe() conversions, on top of your 1/2.

> I'll drop the second patch in my series and use yours instead. But
> please search before sending patches next time to avoid duplicated work.

Thanks. Sorry I missed your series before sending v1, I'll search
first next time.

Arun

