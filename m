Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E78606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 21:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s686DHpm;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=0Z34DGH0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2RdQiDvGhrz2jeibJ/xmaH/ZZ1om+0FyGzyew07OZ+A=; b=s686DHpm3qD0pc
	Bq/rQcUWx+EcJHswsp0WVSs3Jye69yBYwgp7V9ff1Llfn5L+S9ZvHvW/Jj5gLEzFOYCipdXsg7AsR
	5oZ0Yvc6GYV3DWKsvHhDLur82VJ+lU1bqGUfKrSpmhkquKpt7QQBjLGAFKMd5wb/fCpQHIYA6ujHh
	l0rUG1m0jCIGoUL8Sq4oVsssYjJCWQSxG+JiyEpwSXMjHRvBWMRbFNC250nQ1nk6HNoUZ7HL64d45
	6dWsnL9/0kEy1CD+HAG2/3f6tp0oIHM/eTxyiYyf6Iduoap1oFKnY+D5bhw0I0jis3vqVPlVMxK0K
	buPAKqIkWyKA/Ll/divw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAD8-0000000Gh5Y-42Po;
	Sun, 08 Nov 2026 21:13:58 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAD5-0000000Gh4Z-47eh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 21:13:57 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-67bf3c6654fso231746d50.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 13:13:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794172435; cv=none;
        d=google.com; s=arc-20260327;
        b=DvpXCfhLdk8dcdidggTRIibMC/IPwj/5HJMyWURwaNtcD+sDJRwGfSwrYBLGaWjDUd
         no0h4pemFTwDUtsJw313l1/S5kL6ELyWb+XBJxAtduOWl9SuI10bo8vG7necabiL03LB
         MutiXYt9fvDxwalcDvFqrMq3v15CiLNIfH8H3wj7k+nKZ6LBvF8inXyL/4MECMpTipkM
         jUv3mkZLwQmhsmY0v5gj52aqqRTIZsQXGP+ubOUfswVdaq6WNGTncwNFvRL7U2T0JcMi
         f4ncheI1t/u9JVHKVrqJihzFQKMCBA/miMAix6ERWv1cxwNwenomFdZfNxdn9OZxP9op
         atnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2RdQiDvGhrz2jeibJ/xmaH/ZZ1om+0FyGzyew07OZ+A=;
        fh=WxvMGIcLT1xFV3laXwJo01vilS3bPXtdPKVEdzDI8Hc=;
        b=rVFdkb/iVln9hI2DEoi9ahrfJBxbrYJNleDvC1hazsckye8q8j5lOsyY4EPvFQhlJB
         xbW1s1RKjYkVLKAkDDnjKfYAJKr2JP8a3+0Cz/A60SwwfekIVk83dlWImrvH14DhvP/D
         alZ7nBaQ28OfqqAlVNkGzvy09jfdjJaH2AVghsSstyyRNxdtXRT/kLICcMTAm37ugrIn
         zw7Pbz8vhz1MRo2Mko1njFHZ2eFUzb2gJwypEE1Cq3k3gXyIY9K40UQ+KhgQyhMon1kO
         F56XcAsI8QK7svETEPMB39kSJmeq+fxdnkoZl/FYsPYuE8gtscRQpQSPEq+zrCJNhLGN
         +DWQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794172435; x=1794777235; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2RdQiDvGhrz2jeibJ/xmaH/ZZ1om+0FyGzyew07OZ+A=;
        b=0Z34DGH0qLPLW40LAJkrn+8PZbI7OGXW9N+iEHaY+SHGoigv58JRRcfFpUrhv1T9zF
         qjEOryvQP0ycKlDF+GkWhItzPRUBCjzOIHuUeGPzTTqOaFhjQpQ2oaeOBf8i9M1A34As
         7Qk+IR+vNCgT/bV6ZiEAEh51pfL7Klr7nF2tA3xLJqJKs8OkYx/NMI2Ah5+tDYk+KZRK
         MQBiFqUGKfeIoNpD/o4v7UfR1iFAFSNAWQY9BZNeOWWuAIzrn64pZ9EAmJTCL0WasErA
         xTG9G2RVIV1YKNdlF3P/P0mGEog/Ziw5DWy39jSYv/PIem4hjebgPS1+aHI0lttQDFT9
         hEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172435; x=1794777235;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2RdQiDvGhrz2jeibJ/xmaH/ZZ1om+0FyGzyew07OZ+A=;
        b=hlavlx0/Hv8QoFC5sl4IdSzbBi1LK7zTDuBRQIaCAsEuwfE363cr4qCFkonElf+WUU
         wFNirhHipKsx+w6nzkuvUXVHOLNBvgsz7A96bFIXkZoHu9/7f8hh4N9B2Sc4ACPOZudk
         6XKsttupBvRuov3KgVyCNBOqDyAcM4l0XwH8n80XXjTM3cm8INjwgpR3ZPJ6fZoMieUs
         PRUmFz+wlqml4g8HlF70titseDTyE3zNci9FkMnFiVJCFFOsBtmIc7ZFwT4x2z9G3voY
         tEx9cM8P71i3Hv/fepSoeSYL694uf6sV8I5XnyAoHWUPXFNlxneB1nOalUXwcxt9zbhp
         /jLQ==
X-Forwarded-Encrypted: i=1; AL+hErHxmx54hxvYGFTSLA9hwkRXcvZhwgFOFh0em+VaEL+j4qI7lF/E4XENuq54+ffoXrW+XuQfkZyN83NBXZTa4RDS@lists.infradead.org
X-Gm-Message-State: APuU4Z9jTNoGsz0HKX4xjM2zULAPYnoREFOw4ZtXE0Xq8rPHjNd3+n/o
	TOqBTaQ4ce/E++D2zhtfG79vdXy3bkaiwcp5S0e4KAiMHqygkDq0TdMJ4Qu6znhXZCpbz7/F3by
	1r/fTHaNyB54HyBVhyYxgCHPuHu9OwZ4=
X-Gm-Gg: AYBFou0WrtL3+SCpwISVEPcSYjeezpbirtYe0gmF05lM5kfo9g2z/UnwFbvQGrzGVQv
	5yMlMXqZ+Mxu5asziz3F3YvcGr6RdVF3EAZBW1IiVzcwtLVRUTjWQ5uxiw7ahEJKbbWjCJt5t5b
	LWtyZiXFo4z7eELX2snccOn2OXVkPdgjVE8s2pyhMS66YrsqSCEzj664+9V44oGgBAEMn+EtKnx
	vgbdUOuLm84IiyFM6ANl2CTQ1yhaHl2A9oR1RDE3LMYhEyQwygNDdAM0WJ7sICL1qr5HGJnjeax
	gCdAmCjuhMo2Hv90uNHfG+Aq+FA9O+s8RO3DnXIM/VeX+q2fqSuX8XA4WNgYCfdSGoruker3KlO
	K8I+x4rYgFflq0xyoIUurrqxzn4mwLf23LQKxx7BQoBCVq2tc/nPstzk6GTrVaRzCyOTgbA==
X-Received: by 2002:a05:690e:14c6:b0:67c:2674:6992 with SMTP id
 956f58d0204a3-67c3d7b92a9mr1205372d50.2.1794172434690; Sun, 08 Nov 2026
 13:13:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261101232011.1172410-1-martin.blumenstingl@googlemail.com> <179369963832.2329937.7183164129825631720.b4-ty@b4>
In-Reply-To: <179369963832.2329937.7183164129825631720.b4-ty@b4>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 8 Nov 2026 22:13:44 +0100
X-Gm-Features: AclHuK8wx9FMQM5aByRf496tUFpAvyiGNK18M8rQvRUAwwPg-HD-rkEq4isW6Fg
Message-ID: <CAFBinCA+4iF4u5qAMh78EVqjLTrx+2z68n2MC76bFHUJYbe3kg@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: meson8m2: add dwmac 3.70a compatible
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_131356_022750_8F6423CE 
X-CRM114-Status: GOOD (  11.61  )
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 3, 2026 at 10:53=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On Mon, 02 Nov 2026 00:20:11 +0100, Martin Blumenstingl wrote:
> > The Meson8m2 DWMAC reports User ID 0x10 and Synopsys ID 0x37,
> > identifying it as a Synopsys DWMAC 3.70a core.
> >
> > Add the "snps,dwmac-3.70a" compatible to match meson8b.dtsi.
>
> Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogi=
c/linux.git (v7.5/arm-dt)
>
> [1/1] arm: dts: meson8m2: add dwmac 3.70a compatible
>       https://git.kernel.org/amlogic/c/88da0c14921c8def2775d5238ecaa5934e=
603da0
Neil, sorry for having to bother you here.
Can you please s/arm:/ARM:/ in $subject?

