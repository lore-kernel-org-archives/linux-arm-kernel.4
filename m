Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE2A606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 15:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MDBvgG4z;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v9ve0Kvj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UvR6QVMTWq8lS3fJb3iOdZEzYx/44ehzH+OdzQnQ9rA=; b=MDBvgG4zB39bov
	G1rZj9tYmSmfEeB2Dd9QxBv3KOU3+UF1EmmlLQFlQagoSPnvDk4uGmkRlg1zlkDCAjxV7uis3L4si
	3bn5Q1urAHbvap7rV9ckPF/hbGpqi/pdplGEAlfQJzF4eCEcDDtp+wCTaDZy7DsFTSsDMuEhCSf0g
	6iN6iru/u7aV2bj/IFrlI19xZcNiapv6jxirifrmB33NTD3/8fxJwlbpefmyzWSwU6ZxHMKNzCOMr
	v62WYPuVVPlfbpindti5g72QZn+I8tD4xzlAEPksh6+nCRB9UtYyv6NInSdnhKdEyQ7MUKuIzYzDY
	0G7ybpSr5V02rMZdxciw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3lC-0000000CNIi-26WQ;
	Thu, 19 Nov 2026 15:09:14 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3kr-0000000CN83-0PWf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 15:09:09 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-3ae2fb3fe2fso23809961fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 07:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795100930; x=1795705730; darn=lists.infradead.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UvR6QVMTWq8lS3fJb3iOdZEzYx/44ehzH+OdzQnQ9rA=;
        b=v9ve0KvjUMnRryOb+x4FbTIF8UP8rdzV15KOradf7GrdOdlGHQ7MwhI+PXIsGpWZbW
         0qOA3ojAsekZ+RNdPw3YrrypbtoXOjG5zokqs9wlCGY5ftSJizFuqZG84uijKugawTbX
         1Ghn6cvIvhh6n1n9KALDXi+j9lLEcA4/ac5E88hBfDS7/DBK3I1YPfNM01X7mjmuqe0A
         l+6jAgVud2GN3DFFITNAyE5t1G8Cr5uY5dgbAl3/j+DZsO+b0z+vNo8purWb3k7KnHDf
         +uXq+HL6+Fz2I8Af18I+0BzKFpI6rJXma5UEooKLGpP5UIl3eE4e/Rns/7XmEfV4VeAC
         7lXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100930; x=1795705730;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UvR6QVMTWq8lS3fJb3iOdZEzYx/44ehzH+OdzQnQ9rA=;
        b=0/4pNzKZ6rb68IBRGCoWNOZh3iGeG4mAY10U/vTb7iVxqDntpdUNY9RVpDp237Ow3R
         Qc9qz9I8XFk69CwSqZyklp3m5jz9aaJBiI2dj5N8xd2poeXHgtVucmumqhXcc25TYgLT
         zGSRlN2hO0td/vgBDq08B+tvZKcG8EanyU4VRFSR7lRl7PvP6QO9diedtxAN7bdikuHQ
         Z7qdg8ln091gUjql1ug74pKci2JsQQ0T7d5Z07BGS4pqQQLmL1LBPzkSpUWThIG2dZUE
         i8qAphBcnUM71uEx2+giBJqspX7azd4VbS81bvj1W4/w4EA/8r7dc/Yzp/VdD1Ok9ZMA
         wzeQ==
X-Forwarded-Encrypted: i=1; AL+hErEsue66x+BidkU4uSzJQ4FcQJ9pfw+pJayJ5BmvMHAA13amTf6ZYoa6J1RAxveGJZJceIRIZSb+YqgvLt5E5yEp@lists.infradead.org
X-Gm-Message-State: APuU4Z8IebgwO4gARq/tejxwUSrFiPU77Pnax4M9ZuMnUxZLh/j0WB7a
	QNiqBYKJnfwGu1LzWHOmpCfI+8Xm8TBPMV75VkQ6B/ZOA+t76Dp08IYfKfYVSqP0D2sWyCU/
X-Gm-Gg: AYBFou1beTYZoS3wwO+8lzlXGbuPv8W+RGM/FWsHNvYjRK/rmUUPNbwC7LuP9X0p4WP
	Ncq0chIkAY4iVGuBwOwWCw5k0EHzwcgTmqUpXt8bbKvanaKlIOv18Akz3Uc2sK/l7ey/GcozTo5
	TMVHX89VK5mQwobNuxv0YikFUIB1BdOIX+g3w5jjn6rlxWKF1/sp0s/NsSGwdF+TI2ORno9UcIW
	O7Lp25g/TfuXWGPIy3gzyv6XnmFzffoqS7CsPnp7cYwDUkaFiS2x8R/VrQJkdSr/OxHjqJbtffQ
	/y9PKtJXiXiZWtTV3EaI2Gu4XSX/L+vC+AQ2wO5qo7egaQrbBVvr3VJEbss3dEA4TbLNZxyWaYT
	zVOB/yrq9aElnv7lK1/LuKymyCqs/NC4WbfMhq8tvJKEnIBzGnRTf19ZIp86jeScrI7SBVMXHEw
	Lso8KTWMP3buln/+6BsCgt7b46zIywoXu9VXSJ68Bg836MA7g1XgcWABp7Nda4+zy6UJs+CnmdB
	2gQ83ymzm1gor2Qk5P5TxrpH8n/hPsfUPrRLf/VKSGefbJw0Jii4NrT+TTynmBc+KYePUxvgaVt
	PYN5So1dTFRjUFgSMZnU5YF/Bzs7mPnSWFOEZkvvJNOhOf52AAHS3ys=
X-Received: by 2002:a05:651c:a184:b0:3ab:1207:bd2f with SMTP id 38308e7fff4ca-3ae7f9da258mr961291fa.11.1795100930127;
        Thu, 19 Nov 2026 07:08:50 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae6ebef2d0sm11809841fa.37.2026.11.19.07.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:08:49 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/2] gpio: Add Cortina Systems CS75xx GPIO driver
In-Reply-To: <p3qjb3oncivinobxa5wvwwkql3xmjfujdwmxigyxczk5ya23ua@xayhbwbn35af>
References: <20261119-cs75xx-gpio-v5-0-8d14f2bb614b@gmail.com>
 <p3qjb3oncivinobxa5wvwwkql3xmjfujdwmxigyxczk5ya23ua@xayhbwbn35af>
Date: Thu, 19 Nov 2026 18:08:33 +0300
Message-ID: <179510091368.5.7008617353574583652@gmail.com>
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_070853_638435_F4402294 
X-CRM114-Status: UNSURE (   9.91  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Bart,

On Thu, Nov 19, 2026 at 02:42:27PM +0100, Bartosz Golaszewski wrote:
> The driver looks good but I cannot pick it up while it references a
> Kconfig symbol that's not upstream.

You're right. I have replaced ARCH_CORTINA_ACCESS || COMPILE_TEST with
OF. The driver only uses generic MMIO, GPIO and IRQ APIs; HAS_IOMEM is
already required by the enclosing MMIO GPIO menu. There is no need to
keep an architecture-specific condition here.

I checked built-in and module builds on ARM with GCC and x86-64 with
Clang, with OF=y and COMPILE_TEST=n, using just the GPIO series on
v7.4-rc1 without the CS75xx platform series. All four builds passed,
including vmlinux for the built-in cases and the modules for the modular
cases. The GPIO driver code is unchanged.

I am sending v6 with this Kconfig change and an updated cover letter.

Thanks,
Fil


