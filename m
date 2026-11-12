Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79215606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 06:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CGisKXlS;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20260707.gappssmtp.com header.i=@ffroot-co-za.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jMVVfuqv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RF8nSYHgZ3mAndPkH0mt47AX5IWuspIpOM9gMeupC3M=; b=CGisKXlSnoU8Wjt/G0cVdcKOcW
	peGM1FQoukINwVIQcwXdy97F92DraAamZbuLDi99+5rmyXI/Gx8VtFWbIxqzrbYnyjwByIjjGUshy
	z5YntbxbPldD9d8bj0P2Q3FyaCy25tygOHnBmcgwL01iS0bcyygyb/KUcdssCn9B2a4+gRlnYlUKc
	FQ0WwGHTjafGI3JOzngD9Q9/PjRaZd83svjWuWpCDjzGm8b4bu24GKipHAhKerTtU6w+UC3I6jHlC
	WsxtfpeHuoWpNiS4Px8Mpbl2m1UOPD9u1/uMQYqz03ouW9q9eP/+xVPESgrwFGVhvCquNbww0N0ic
	izjtzDcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xROHN-00000008p3K-0Qq2;
	Thu, 12 Nov 2026 06:27:25 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xROHJ-00000008p2Z-1hfQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 06:27:23 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-498f5fa5103so1296434f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 22:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20260707.gappssmtp.com; s=20260707; t=1794464838; x=1795069638; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RF8nSYHgZ3mAndPkH0mt47AX5IWuspIpOM9gMeupC3M=;
        b=jMVVfuqvCqWZcVpyA8IOYaWrKZxnTv/lv7/n/xEAlR0UE+DK/mn51Duv1R9App9xwv
         BhknJvK3tGBbfp2jyf+curvzLYtsrl9UiPy3TsC05p5vFFZrNpfAhHCZANIXchbWXR9b
         G+EJ/+bI28nxZEcyKmx/AwZ6mqdqqDHGm4hHjuOJ1Lgpl8tyPB7Q8tr4MeLyEi9Cumbk
         fMimjJNjdjlu+d1gxdUQ5m5uNK1z9lVCr5JUbWEw/fSP7+2g4DgtNKm53ecLeeTzYFlM
         oOOdJvp9d6vwdLJgef5CxprHnTyKeALxG2cBfpd69n8RIqhdm410BvbnurTiD+zfVATG
         gq3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464838; x=1795069638;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RF8nSYHgZ3mAndPkH0mt47AX5IWuspIpOM9gMeupC3M=;
        b=tjSsb30EP2VWspXOOvsCFhToSMY8eDr2BtGBI22W6Eelh5gjYyRkx+otxEX9L6ZqUL
         vtcu0RIgfsfalk5tLE+4AXOJ2VSp5b47Lz2qI/nYrBagCzreLt4oVawKpls1lpCzpX3d
         QMMLlg+N4DWMAJKGBvT1Xk7Cwri3YG2Vlop3cp9COMy8dT7Jki+yMJy/iRfw2lSWUkur
         /rVoWRimDYm/W2DKfOAA8HtUy5eIPjaAFSWKV3CaW674ZHjxcbehfmjOtw5IXm2vBkVa
         dpqhgchKtSJsCAfgM5w5JzOqt+3zErijyfacqYLrMxBEakqz9NY2icH+c7m8+Z/yNGMC
         cVYQ==
X-Forwarded-Encrypted: i=1; AL+hErGFbEk+4KrokFhErsw2UMXEUE0zWR1f5z+sR79zF0+RTkzKlJJEdjFySTvvp+vrJi7bAso+tU/bbDiL0KJ6nGxu@lists.infradead.org
X-Gm-Message-State: APuU4Z9YA/093GLEqdH14kq9nHXg2MBXcGepGT9wwdkBZzt7TGIAOWAL
	dTMQGRfKtpaatHjlDQOKjj06SVoqMSCp0UpmY2V4vka9cclyhDVR/PaMRcchTWGstMY=
X-Gm-Gg: AYBFou1VySC1Gd8rysip0wTCrsFS/KYQuPkQ54zWw4VJjjKMffnD58UKx+LtDceDM72
	n32ghdMhjE+pDSVyCvU5GiWbzyMi8sBo6PS9k9ZvKgYpn2n49ZI1IN05VK3MlMCvo0ORc82VUTF
	4XpEMbXvI3lN+cKjD7A93Y51KxPs0FuIPmxzFA/ckKpX71YkUQX61l0IB23SvAkRadzVT8Dfp9e
	zp05tqUuf4VXpspgCMERe3l1orhW2MBctYR1VEcEeZ/row5y/RwXBD5OKsKKRxk8wvWBkol+IaA
	cssw1pD5gQWSSK33+tvitZwC6WNAo1hbkvdvRY5suS6ogje/IlKq8yxYUIhrO3PyamIrgQDJpw9
	J5yHbPZfdtGXf/N52GD3UVTpIhxBoTsg8YYdrrsN6vzFcb6BqMauuY0WHVxqGMYcbSDDmNpxZvj
	fr4Ks2CYyruivTmU49ShMkSn4DRAmX25v2b1QXE29cj9eIH74YPti2T3EWzFQRmPaFgznpDzmVT
	WuAS56dtwI/mjyrQ5beAeVnVQdnW/o2+zSMGk28PybI7yCojPfLJQ8vN9uREW6SG/Z5j2emoa9X
	zFRnmu+LnLdptMbIEaPh2Ac0G1qaXXPLWFkK2tbe3R8y8dNGqqjXYKiaYVnJRl6cWSjDyKkNKK3
	DL8Q=
X-Received: by 2002:a05:6000:460b:b0:493:2eb8:e7fa with SMTP id ffacd0b85a97d-499c888ce81mr7051233f8f.43.1794464838079;
        Wed, 11 Nov 2026 22:27:18 -0800 (PST)
Received: from andrew.office ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4982eedfb36sm14820585f8f.0.2026.11.11.22.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:27:17 -0800 (PST)
From: Andrew Gaylard <ag@ffroot.co.za>
To: Lee Jones <lee@kernel.org>
Cc: Dvorkin Dmitry <dvorkin@tibbo.com>,  Wells Lu <wellslutw@gmail.com>,
  Linus Walleij <linusw@kernel.org>,  linux-arm-kernel@lists.infradead.org,
  linux-gpio@vger.kernel.org,  linux-kernel@vger.kernel.org,
  stable@vger.kernel.org
Subject: Re: [PATCH 09/10] pinctrl: sunplus: Validate pin_func index in
 sppctl_dt_node_to_map()
In-Reply-To: <20261111215256.1982044-10-lee@kernel.org> (Lee Jones's message
	of "Wed, 11 Nov 2026 21:51:54 +0000")
References: <20261111215256.1982044-1-lee@kernel.org>
	<20261111215256.1982044-10-lee@kernel.org>
User-Agent: mu4e 1.12.14; emacs 30.2
Date: Thu, 12 Nov 2026 08:27:11 +0200
Message-ID: <sa6se1636ps.fsf@andrew.office>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_222721_738906_3441D673 
X-CRM114-Status: UNSURE (   8.61  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Lee Jones <lee@kernel.org> writes:

> In sppctl_dt_node_to_map(), the validation loop checks that pin_num is
> within sppctl_pins_all_sz, but does not validate pin_func (bits 15:8)
> before indexing sppctl_list_funcs[pin_func] for fully-pinmuxed pins.
> Check that pin_func is less than sppctl_list_funcs_sz when pin_type
> selects a mux function.
>
> Fixes: aa74c44be19c ("pinctrl: Add driver for Sunplus SP7021")
> Closes: https://sashiko.dev/#/bug/linux-977252d6-b0cc-4d3a-ae2d-59d1e2f8a649
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---

Reviewed-by: Andrew Gaylard <ag@ffroot.co.za>
Tested-by: Andrew Gaylard <ag@ffroot.co.za> # on a Figment Design HW84 board

