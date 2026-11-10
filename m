Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD63606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 08:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EdYm82Lp;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=yJXNFzf3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WRBGfbs2S64fL/sGXyZyTUAZ/P+8Vyhapa6z3k4bWvA=; b=EdYm82LptIZ9Iz
	V2UAXqBtNpAymVnfopPvoYbAZjz2sZDyvxU4/mlLYAJjobh9GzSxOIHdh1DLPznyv5vED/IUx7UDa
	ROGjb+6e13pdB5lg/XAwMkpGd6hDcy7zotNJLiCPoKEkuoJOVYi1IeJLZNw7czVBv30aBqrby4ZB6
	N51B2/l29mTS/FNSmUHegae2gPZgBSq6vIh8GC0QyaLKdeHM96K2pDOwfazBxirWmdULOeosUK8sb
	xN10Vr8x8iEhvjc1jsccdrDci2WGvUEh4mZ1Ae8PkhJXHGEln56S6dNhC6svmQxrxdvddWofExkIU
	tW/0YtzSpugmm81DOFuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg16-00000002lqy-0zJi;
	Tue, 10 Nov 2026 07:11:40 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg0w-00000002lWo-0cOO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 07:11:31 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-67c05273c38so2028520d50.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 23:11:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794294688; cv=none;
        d=google.com; s=arc-20260327;
        b=n2X5opTuM7p2dqW/m5qZdvoLSmRPmdO1Ovbo/oguP9fb+C9lCKYJouBUvc4FUCnp8E
         r1v1RWFUhvgeGqg3dExfhbQeZ2JV9Y4Q+IgWW0K4sO6Kfq0v/gAF2lEoMW+bp+07SHj7
         wnHxPLmI+2fNGG1oyMOGawrpZLhmOUPJQlsTFB8bSj5/dRH/Nr0kQVPMQDEa8d6rt/Vj
         vTuj7dQFY7Yi563VzlIwlh3THsHi/B+9A4oid71t8q70okngsDYuywjjiBaYlGwphrqa
         LPmQ7Sxe8n6VVtJcHdE797g9+SUcG4PMAzpjGm2ewqonscymq+SuJlfDs+P4gNmv4bBR
         rakg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WRBGfbs2S64fL/sGXyZyTUAZ/P+8Vyhapa6z3k4bWvA=;
        fh=c2y+VzJJhwb5TsaNsgP/lfzD7KjRsbUYPRKxFhiS6h8=;
        b=lGIkg1tZfAebbGvY1ovkc7X4PeV2HvaI4p3AcBLfMjDnBD8cKrmaKAQ7uhMS3Q+N+w
         pwcb+kJDozfEeLBqvd0V3V2DH+arWyjAdhwmQuvgxG4uVZmyORm0bc4osJ2mFfwVn+nF
         i+++3/7CqIJZfpTCf1dzTXnkNjmRN/DkG0Y1dnY3rc/2gjae5FKgZi6hs3hUNjkkOXFC
         NGzoCHjbe4y3dd6pbNcrhthYVHAiCpBeyOsRy1sWJmJqO/z8FMLXvFUcgSSw/Cgzwr1b
         gLJ7gED3h1D1MH+wPIRD6RQcKlno9B5wAHX4XOOOinAumcGFtrD+Q7akyzSn6Y+qKMzd
         HHOw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794294688; x=1794899488; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WRBGfbs2S64fL/sGXyZyTUAZ/P+8Vyhapa6z3k4bWvA=;
        b=yJXNFzf3wfO851HyXeV8Brltmvx0O1RzMGzQIifqAy3NQzdG5Ha8pVo2uwIBpCM2+N
         o5ZmpdPZzrksIkUw7mmgPtwlAekiqF4VxiR5C7k2b2xEL5triq7Xqc6Jj8mZ35Esk++B
         dz4GxGqbjKyV4NrtxYuFkbDf+pMy2HSPz02v+CbpHkQ0AaRBw3YWw5IVP5eVNJNxunvy
         BxSWQeagpL8WK2IKZrKjf4URWVc7W7F8TRWu8nLoXlMWDM26WwOGXmiTznl1wQK8TT6q
         jLOx/8CvJqRmMq49PUMGeii09jodX6E3SaDlJXxi8g0HZwptpDXn5b9H3GVgwE5gMLqr
         k1Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294688; x=1794899488;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WRBGfbs2S64fL/sGXyZyTUAZ/P+8Vyhapa6z3k4bWvA=;
        b=Es/m+WJ17sFC07y4nDbpLg+5ndNVFJQW+NmOksqPTALsgJ9KFUmBb5Rexg02m+dZ4X
         /5Ckjnz7bxv5AvQnlYlQ5gSx/nF/OQI+UnWZ1sg05vON/DaMWJHMD8C64YkRnw3+Ihyd
         5CNsTzkUEv+d/gJrd2lVp+nUvThoViNH8A36T6wY11FHdsg6MyucR9nPRLMq+zccA8yI
         Jif9iflOhcz196tl02RsiBmUViKn/A+y8EbH+rUdEkGq6hF45DVa+zhHB2l7q5Y54dxs
         dngIjCKKi+tNQ118H8SOxKi54WCt6l0wCFiCVa0z4sn4UJnvdo6qkvMAfVZy4Z8gWrkA
         YU3w==
X-Forwarded-Encrypted: i=1; AL+hErGJH/JwOiOSUSjTP4P2qNUc7JqM3vwwyDrPCWcrlSRq/A1t/JoTcOe4JCgyqw/NoQQ2eMPe2kD8E1QNNSYirdWv@lists.infradead.org
X-Gm-Message-State: APuU4Z+zUe9b68k+9ed6W5fGHYc5TiCVdbBY3aPLER4nBDBDOllUbGL2
	4ua5VJRxMu5lzBEaVdSPi5eiwlC8fztEe6bXsO35JMhxZciuX85CeW7JYNvH0s1EUoVQfRlRyOy
	N2uSbCNBHAlsYdG/Tm+4QorP0Ay580DQ=
X-Gm-Gg: AYBFou0TOv1Mck6v0fW+SwbQ4gUSkwEPQShj0/nhqHYIZPyfBz5hqAM6cskVcfJ0M8F
	/1UKwF1bGGuTGbs2pc+fbx9PN0fSxu1YoF6E6g+Nahj+XKq1FG0cE8NFmh7RNJLr7LYqiUJc8vM
	999SJVThVYefX+bcPd/KrJ7bWPvcqwvST7IX8KHBP4kJJvUdC0alMSIWoS2dagaLp/9jD4CsBXm
	MaIpdcEkeu8dINxqkfYivxuug96EXlPkJoq8TCKOvMXa+jbYT3XZA8hgHVXYVxZBVS0M12IkyyV
	0nL1Gwx37/x8p8H0NoIBeTK1mRnDYdtevw/Qnr6TyoyzpDpdvDc5EAL5s6rRULyzuwh8vxXfya3
	xpBXP4SqZR1Gk2/Ku+H/phtbEsZ04L2eRfknr
X-Received: by 2002:a05:690e:480b:b0:679:c916:46ed with SMTP id
 956f58d0204a3-67c56867600mr864381d50.65.1794294688510; Mon, 09 Nov 2026
 23:11:28 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106101954.46907-1-christian.koever-draxl@student.uibk.ac.at> <20261106101954.46907-2-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20261106101954.46907-2-christian.koever-draxl@student.uibk.ac.at>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 10 Nov 2026 08:11:17 +0100
X-Gm-Features: AclHuK_6GpTQ67xpDENQByDg8QRKTv0ORuAztrJZSqgIK4qf--6_2HTmK0qNm1Q
Message-ID: <CAFBinCDi3m0gMTQBCd-yrCfAKkT0QeuXq0wE_i+CfCtS2oX+yA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: media: amlogic,meson6-ir: allow wakeup-source
To: christian.koever-draxl@student.uibk.ac.at
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, sean@mess.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_231130_204841_B830530C 
X-CRM114-Status: UNSURE (   9.77  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 6, 2026 at 11:20=E2=80=AFAM
<christian.koever-draxl@student.uibk.ac.at> wrote:
>
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>
> The receiver can stay powered across suspend and wake the system when
> a remote control key is pressed. Allow boards to mark it as a wakeup
> source.
>
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de=
>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

