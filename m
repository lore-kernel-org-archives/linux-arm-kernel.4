Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDDF606E7C8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 19:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zsy17LMZ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KFORJDXR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iAbjlXus0iw2LllxqZoryy58tCqmnnXTzlAaD4u02/I=; b=zsy17LMZpwKy1heVWhQ86rkVA4
	WOcxs1rPaBlhaZvXAHI1fPxRXb3HXKKA7HDpWkgJiDlGa6lxx9t5K8DUhnpEFBS6UCUTm7i6wtt/V
	f0nz6bZ/23rjctU9utH2X1nC+pY3IlmkDeGpg4cDlnpq2ZVLY2HlkRpjHecvUkYHPAAI7L8jaAJc7
	rxFgO606uKLNnNof9izq9vfBXtp+22oNkIGnd3YCnANWCNBX2gfSUWVsNOOR+hftFmXcV69S+KPIe
	YtDE0pRqYRPaZqSqiPtZIiDCgKWTM84eBncDq/SZ5mAsx1UiZ7hgmrWK4kmKSQuaIM761jXywDZPO
	HU8wAFyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTlN7-0000000A6nm-47hi;
	Wed, 18 Nov 2026 19:31:10 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTlN4-0000000A6mQ-2AXv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 19:31:08 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c4d28f75d62so238666666b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 11:31:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795030264; cv=none;
        d=google.com; s=arc-20260327;
        b=rJGbK0dy34IQgPnEKRTGOFRGN8Q1qbJgz+PEX/1PUjq/oUCvIOPM/08uEV85AILRV6
         /Dr0ZcRYAdI41YpHr5C5IHDy4ie36YlNyCLu3wpv3ISAYS29A/OPAk/oT2E3ZAvJ8C9P
         ZCCjPOT+/klJl+KjtSz2hXTnB8OaVMSW8k792TrQL6kYsmTey+k4WqMZZPzwoOk6HWZ1
         yBiKerOVA8eP0BzbrJccUH3eXolY6+cLnz88dAOwHYSVlAYSzC+npyMjEF4oaQ1R/uug
         gXP0eTXo6NKh6IRVPU4Y+Rb3sQlUZSF+/oiCGg0Uz7c7/GEtzp8uI1TeJBEvGd6ma4Lr
         G8fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iAbjlXus0iw2LllxqZoryy58tCqmnnXTzlAaD4u02/I=;
        fh=/8rOUrcoMJK+DrxPzmXu3Su/TGchvmmG8V1JqGvnkvg=;
        b=mwTAcI963cOb/lR+DjzJXBX7z4cnlX5TpnC0e64cm3x9rwsDnXLeTaLJwUG7YA2swO
         2mCvs8MWuEj4DSjT1leC8Gdl7W735r+teUyMncOoQVr+6FAeU4dI/NxxdlfwRVlHQ4J8
         utfjZwon8V+U3xgMbFgFDtNoeUKDbVGk8nA26T1x1sSv5k0cJsG602LeuGVrvPfM18cF
         8yjrtHRBcup4w3V4MDSdytBpw/kQ5bOE5ss+FV9uxwq1Hr2tHlzuwEoUwV5UpHAiDmUf
         T0DQj5t2oChlHvY4vByMk+XTAE8xjhOvUl1bXTo35FywY6CbjnBwY9gthSSqK/eT+Yp4
         On5Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795030264; x=1795635064; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iAbjlXus0iw2LllxqZoryy58tCqmnnXTzlAaD4u02/I=;
        b=KFORJDXR0tTk5KVgNDJhdCtuAgVz0rLNYE+jng1gmE4Y0jRUv69jgdCTjFELfQfeM+
         8uKgygon64V4PDwFSAFiCMyrGk7uHrSTl+ZTxua/mY18dqqXgMOAUGLv3zi+HOxt/qwo
         CiW9mJvIeFfcYz2uf/SWpy9nO8umxkbVU3PPxyXAb31axBDO57ktFk4P3Qa62W45wdu7
         cz73KI4vF1CccipgC6op1rxRCzKthO2W1/2NWwxNXFKvRUie4hSlvYii6+hoKLMNJH75
         epOmjqkJ44tdk45V6L2YICnFI+62cSpj4B7PzPDQ4r/4UjONdG6AxXqBl2ru1NKWQ5NJ
         6p3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795030264; x=1795635064;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iAbjlXus0iw2LllxqZoryy58tCqmnnXTzlAaD4u02/I=;
        b=HU80hGwZrDq0YUHg/onaKv/s/AGBBNG/jY2wjRTVA1kcoPFJXZ+ZTY4h9GnjW2GGdz
         LvxT/Dqo03Y6qqfJTGNCUhpRwhfNqyx28E+jpe60xwImLzKLt6QV9VpMru2gLcWObQIw
         E23n5WGKnksDYKx/XHajyWSe3d4ZsngOqaT9u7XduBinbhMP0oirXEusvT2edjW8dZjk
         emUpwBdMDmjEWq6qTph95CP8RkO5BprBvCw3qLveAabeDkD3Hhzjpyfs4NknKv+uCIF7
         B9WEUkvgDdih92lmuqcfSNV8QSybqXAETO9ZsaI6yOuHhsdHf5kN443B2MSJRdC9yD3d
         6SGg==
X-Forwarded-Encrypted: i=1; AL+hErHhciEEVUVTEmFKh6IAZA/LT8ipXCwdkO6yiSP+W/RSCjcdaaOAeD9y/rEXGAZ+WdRJovjZ3cKwGcO8/IKoYcIz@lists.infradead.org
X-Gm-Message-State: APuU4Z/5ayXPtZNTrwrRU28paBd4L5TvjAXsw1f5k/nRlJnHYFuxIMqb
	npH8tmHD90zazIB/cmIqFTPBY5qRGNrrOmVk+bixw7S211iAO+LUpGNkF9Vjxw9VhVZrnarKYRl
	DCJwXOu9PGctQ/3XgaHBLnFR4VAup5b8=
X-Gm-Gg: AYBFou31heRLp4dwDPgLqf60YGMKuSzRjwBKZ8r0wXQjiSE7okZB/L2xX9V4C6BejY2
	+AtuXDPDaOo0OOG0M4xBVsIcXb4qd1LWgfNyxXfN7Yew7yGJ6VQqNQ4L0YooHxjJXwy4dx3xM9L
	z88Lj4cqlkPBAmxtIfnU59YwsHHU7BFnH0AnLL4f1AxH1s6G4+9pNV2bBUAnEnldRtnTG79xaRv
	T/RTQfUIZe/nr0BXWlM2BfXCa4zDvV1TrpRdOhEpoGwNCU5mDEbeWC1TOcHiknhltivIh7UZBuY
	nXu9ptWZElethJyA/tLA8ADXYRoJyub0mdak2t5PZfZ6hQd8winhWz5d0USCsIzgwRrKzCIDfCi
	PLQnrVYe85KqPQcJHkN2UdiTFPWLoWEkMcZI=
X-Received: by 2002:a17:907:f816:b0:c2e:317e:d711 with SMTP id
 a640c23a62f3a-c510e398889mr303013866b.27.1795030263845; Wed, 18 Nov 2026
 11:31:03 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105194426.1113050-1-l.scorcia@gmail.com> <20261118152346.GC98456@joneslee-macbookpro.roam.internal>
In-Reply-To: <20261118152346.GC98456@joneslee-macbookpro.roam.internal>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 18 Nov 2026 20:30:52 +0100
X-Gm-Features: AclHuK-Q_ZR_eSDZWgs8r4i-RTkFZUMV5FI3ZV4LgWAQGQjLtUrjcLbEIObtllI
Message-ID: <CAORyz2+7q3BTeW3NsaiwN9riAbHV0Q_tCm6bBV7RoiDeAbcLrg@mail.gmail.com>
Subject: Re: [PATCH v12 0/8] Add support for MT6392 PMIC
To: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, 
	Fabien Parent <parent.f@gmail.com>, Akari Tsuyukusa <akkun11.open@gmail.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_113106_581193_205A9030 
X-CRM114-Status: GOOD (  11.17  )
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

> MFD looks okay now.  How many more Acks do you need?
Still need the regulator Ack. Mark Brown provided an Ack for the first
version (almost a year ago) of the regulator patch [1], but it was
substantially modified in later revisions so I dropped that Ack.
I'll move Mark Brown from Cc to To tag in this email for a gentle
ping, I hope that's not against the ML etiquette.

> NB: This patch-set looks split in two in my inbox?
Now that you mention it, I see the split too. Weird, I sent it using
git send-email as always. I can resend it if it's an issue.

Thank you

[1] https://lore.kernel.org/linux-mediatek/20261105195206.3440-5-l.scorcia@gmail.com/

--
Luca Leonardo Scorcia
l.scorcia@gmail.com

