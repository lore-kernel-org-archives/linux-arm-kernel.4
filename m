Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53259606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 01:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y9J+gTu4;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w4rcdPA2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=n14r7j3tiWrKvVPoznKApe6IXK1TKN1rvekMdWEmVq8=; b=y9J+gTu4yJS03A
	LJE7QjE5je1y/oMx3l5FC7KL9So8kOR3Pd75k0HbOn/Wimlu4fcL/QBFiK+H+r/gCR2V1dHhZU0fC
	T7rSO0d6Hw5EuNAtzecZ2dtKBl5gula1cSFJSIIOC8Zm0ly2e6Ru0qwZlI42P3sJbxSN057M7u8+S
	yUY+GhoewvBOpQnsxr5AuOC8+9Uyc2OtlWzj4HHBiuqbZ3+oghB6JqCEBYhixd3tm71FjbNg7mykb
	BxWm8I298ZI2zEqc+vImC4F4mOu7XQK9uAaE9u6LxjAjuE4w5rKaNk9EPgcRYkH2H5KBPtJQFmULz
	hS9AaKTf8Txlgua312Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQxay-00000005Ou9-1bCC;
	Wed, 11 Nov 2026 01:57:52 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQxau-00000005Otc-2JbC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 01:57:51 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-67bec5dc8d4so1863726d50.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 17:57:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794362267; cv=none;
        d=google.com; s=arc-20260327;
        b=ATIR/g4rbGrR8ebS591TuptTQHdyjTgviy/fdHh2ULgDeYP/SrAwaXnH1/r37qSSGt
         gg6fzpVoQZXUnAgMD+6yOvzIXI5FR/1glI99FaHa7cBt6G5sHsnC9IcPLNmzoshY4f5c
         mlU6aumN6gmnTlwr8S37Cgo94B23PFrL9R2Qehd16/YsId2qRMq03FU4dex6VxfCdFdC
         3c/IQqOypAGzOWM4fTwR5/dRjUcji4IqYB9AE5nE4MdzLtnjtdK+hxNdHKJT3JZ7GFug
         yy2Dlwyx1JMOswMnbZcN0ADkk5/DhKdRVQ2BgL3IInfguzLWdYMGl3nHhFmPKmBQsV0m
         bDRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n14r7j3tiWrKvVPoznKApe6IXK1TKN1rvekMdWEmVq8=;
        fh=yrTrLUodp3MV3J5rotSZ4Ao8fx9Lr8RZJ/4vLwGXZvc=;
        b=nygrk0+oILmgTMzVVdOjbZZD84HHZw2/V0xP7Fe6vUMz1c8HoDkGDDV8cWHyWdz/nw
         GLdFoJVA248VS7Ochh7OASb4ADAfqPwVWhLPG2mqIXw5xw+FDX4vzgkGLeplEKiuGPY6
         CLyaNBotIipzZfjgx8pwX//JlNY8n7Z+Ge/8I9nLItlkAUjITU0twW5qoBSKBA0ADqsU
         KKdF0Rdow9nz0nECpW1jxBFjpwWSXIY/BSnsXSr2W8ycTTRpqZL+13iG0IT/QYoMZM9R
         +XX8ebvCQuIRSlaUCa5+eD66VybdtkcmZMJVCKYeRQJ6CKYClxHAqq7Xfyw7aL2v9du2
         vuEQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794362267; x=1794967067; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n14r7j3tiWrKvVPoznKApe6IXK1TKN1rvekMdWEmVq8=;
        b=w4rcdPA25Ol+q3yq/quCTAzs9xcYX99vg8c7T5By7T/WD9mU44qQVX0Xgp5D3nkgOS
         8u+Bo9XFdb915uKKqqBu63e/AKlzX0hnYuSdNTzmjAyTTe5ETXTwO4gmb8/vQtg3NKPp
         Zv0Yu2ifnQ4nvo99TdS20xxUOMqG7QY6Mx/J4aX+A4lSF2SZfAuBymx0ovsmnWAvw2Zd
         LAyFYjnx4lvcdrqAmIGtxgx1xFga+VLnW6pL4QrLe14iODjUYOwz4w6zKqNciw05bVcx
         qcZ/LOrNmXXTTzmMzCtH2eD0lC2Grx0jkCZXuuNL+2B6Qq9tBSEH9MAQJk94XTP0piHd
         L07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794362267; x=1794967067;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n14r7j3tiWrKvVPoznKApe6IXK1TKN1rvekMdWEmVq8=;
        b=JgXW4tto+/D5gtw5yRooWYX8htHM6p2kP7EsA5q21nkgsStpLylHQxayCQJ8QR3vSd
         455Q7B/UVeOs+UhlsUfMggHS2wp0a08AQFcsve9A8d+pmazMG54lOqCg+Kllz31sFkIE
         qhEpZ7YjSNhiNgcrXddPJRA3YwmrHMQxK/6U4ORexQXqwHaP1fK3sSJlG0xkpuO6ymVz
         LoqSQLJy+kTZBvWmpUzdyAVAl/uAgkdZcRP/Dc3S5Z5382fpLKISbIpZwvxSYL06DYei
         iihz4E5X+4Wrl9c7iOJIDoJ4gN8TCM/BPf28oZNVQC/3dTiJJrY5+2JiPEXsVoTC/p63
         bBsQ==
X-Forwarded-Encrypted: i=1; AL+hErELQD0S3mKkCfr2mdYPoWNXt6i8BOH7MsSkuGZFGojyUbqcC2EvRc/Z9LUX1UwFB3oGuFY7ExKls8U/ELvPRHgx@lists.infradead.org
X-Gm-Message-State: APuU4Z/xI5xmX5EwWIqchtaKxPLEBOdTbHUrUQzTEZKEzSXdcyb107Dv
	vXi2S6HnoFNN4narK1wGjikZLBW5PE2bggNl5p7kHk6hpAZ0HxJGYgIXw3jpUMxgA0wXHrapPbL
	bjb7kJfUUt+eA3A5Y8fSRxI64e9YhOtVAGACJ
X-Gm-Gg: AYBFou3FzLhXpXyd5UyR3Xko2gg2+C6aXxVAXPulajgM18GHSj/TaGGKu7K6oSLiQoy
	Wc5O/mjCDzVzra27mbHbFuS41EpzL+g9FBmdYieAcazTOze5QXvTuIcGp+ybvhgpwtNfE5Mzqoz
	wy/VUd84Fwhylqis6ClswOZUXAUonygBMdtU8SX/bCTwfGaZKjEs3y1jrOqIJgbYh+bs14OxzSK
	f9A28PblKoFPcP7IsdzbAM6gd4inpwKN3C8vVaut7CmPxpEBSf0YMQ9STPaYaDMRgjojM+Q0Ol8
	MaDGfd4lNZNYmzZ5h8Ir9LsgcPg9ZC5Ff3yywS7TfOxGYlTPyVccu5ZJwr8K82etxfaZII3oWy1
	5G9SFj9MX16foVrjX6soipVMiQLUk0OnBZSU5PbwcPWzUPaEdqDga5hBpUR6uLkxY6sk=
X-Received: by 2002:a05:690e:80b:10b0:679:a190:cf21 with SMTP id
 956f58d0204a3-67c67f54906mr653906d50.40.1794362267159; Tue, 10 Nov 2026
 17:57:47 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261108-b4-apple-mtp-keyboard-v5-0-e2c97b82669a@gmail.com>
 <20261108-b4-apple-mtp-keyboard-v5-2-e2c97b82669a@gmail.com>
 <20261110-accurate-unselfish-cockle-3a39bd@quoll> <CANpmGNufv4_PM=1D1E-KRNQOuCPj8k+sGUJ1Y2HkkAtoSuL0Ow@mail.gmail.com>
 <3b5ac166-17aa-4418-bdb8-c7b9de22b991@kernel.org>
In-Reply-To: <3b5ac166-17aa-4418-bdb8-c7b9de22b991@kernel.org>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Wed, 11 Nov 2026 12:57:35 +1100
X-Gm-Features: AclHuK8xliRxrSv2YHsVIHXaEDGub-xO05VL_zEYwoOsVKkETettvgLLeJxK-6U
Message-ID: <CANpmGNuQQY-aiorBaNmzyywsVNR0P0NzCXnYweJ9fmkydYO2Gw@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] dt-bindings: input: apple: Add DockChannel HID transport
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_175748_606539_8912D231 
X-CRM114-Status: UNSURE (   8.43  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 10:30=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> I would vote for input/hid.yaml
Thanks, I'll do that one. Because there's no change to the actual
structure, I'll wait until the 25th before sending v6, to give some
time for the mailbox / input maintainers to give feedback on the
drivers and anything they'd like changed for v6.

Thanks,
Michael

