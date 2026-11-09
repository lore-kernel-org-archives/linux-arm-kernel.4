Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3648606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 02:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N0adgVKG;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=za/vJNh8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+ltUm63Ka8/fIiMKORBqPHL/abasOjV2ks0cibiXpcc=; b=N0adgVKGPQe1A/
	kxI5mPtl6NcycKPHyfzJOO+uqH3044iahUdSlLHghvL1Queg+rlNCs1y9InlgQhU8TVeNKziUvX/u
	NIGMt+H3q6wB2xOB6GYFKu54vgCBtpS1KouisNcjNBzTJYFxoJSQG9aw8xCNXlFLy7Gq2+YNyk5UP
	6HLa/6u8Ws4QDMTU92UMoiRS6MQOkFUQ4SeDxmbMu9EVGDXecgkLzI2XRE0+hGQOAzKy9x8BBUlv2
	GGzHSFoS/dWNHdQdkMjRy5zlkWaKCYjfgpqkBUOvcQDkWgZvfwjcB55UQW6aaL/OWnR83+2xIPt0L
	ggBEhDgXp44FmI2W8Cqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQF2K-0000000H7KM-0lSV;
	Mon, 09 Nov 2026 02:23:08 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQF2H-0000000H7Jb-0PC0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 02:23:06 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so181182a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 18:23:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794190984; cv=none;
        d=google.com; s=arc-20260327;
        b=mnHZT6EX7e1H5EoAMg1YBxZcu25ZNGxVY7QAOU/rBs6hyCBSjlY8fX7lfGxKFTK70A
         z5Bs2UGFXigp7WcqDFtN2W+7e1icT1U9DPdK8av365cetBmeDR+WhiJfGs0XrUocVniE
         K8VC23c7FizY0ovi4LKod0+xZ9/kpPscTw91eE/PCUMLOaM6VYZPdz2AIos6D91gtmBx
         bDp0Fhsxwk+FlIP/L3q5fHCxSxrOemyeg2Eg15V4E1e6KDLmh1dE428Q6xxWudEACXgl
         26mQ9UxUeEIzEpDLeCjueYRRJVPYSYaz1OePTmP88u0a1sH6/pvspWreGsxMu423iahM
         A4IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+ltUm63Ka8/fIiMKORBqPHL/abasOjV2ks0cibiXpcc=;
        fh=qPEEdU7whKqOpzPDBNQiid2Mkmh4qFvY9Jd3Aw5xZ7E=;
        b=JKpgdUZEhsXe633GEOo6rsfzpRITP/zmUVb+NFkpRg4K8c8Z3u5a5vs3wLONerLDpM
         72E+xffKOShfXn7RNzY2LT8+3nnj+o8Z3JdUbkfZtzjBftpnbMr7xncVo8u4KoEhYm3+
         5IJU0ymXUIhQmN4ejrS3s2putmhRBKYJpUtKcNUf8XW7fOMO6jV+9l/Pp1mdEQA5Y7t5
         zVtjQinhk3HVVtIiRzs+3SpYnvYkW7oc7LVsaSrxW16Uu4ZM++7KONOnlcgJPOUlwxD2
         JLuNZ610Da2+iNSXMrHUN9bk+odMdaJzuj7B1bbipmL/qt+f7ymwiOL/Qe2JPSA32lJ/
         khdg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794190984; x=1794795784; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+ltUm63Ka8/fIiMKORBqPHL/abasOjV2ks0cibiXpcc=;
        b=za/vJNh8obkCXKuk+Q6n1oJGZ8CGiDPIuHw8TBNIUeb/dMMReZmOXndrGSqP2HENOZ
         9NGHAtKKMp9//cbrJtevqA33oMGDm0/mK71D7R/Lugt8IpWemPA9Lk3to0/ulMw+A+vA
         yi7Lkb0gad5IPLq2okTtlG31xh1oRax2t/EOdxaVguqTUSueQETt+phbstT9lZuBbcJW
         /YMwORdaofOD1ZqfKLdWCd20rSvkPZyzWRVPov8mfiM1Zx+m7ScSyPMJl1WCScErIaGV
         BXlcuq330Xq2yuVlegqAlN+A9jGOkIDPbjpOzp+Yv1s7TGV2juOHjrRyL5EFyEg6HvfS
         IaMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794190984; x=1794795784;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ltUm63Ka8/fIiMKORBqPHL/abasOjV2ks0cibiXpcc=;
        b=wmS8eR0Sp6D847gedkS86wLUPgn/+ShJ6Xc0SJhwiYDRPoRjzIMlmWuLlCSmT2FOFz
         oIDELQ7+ZvT6VUBdcBUcgQXb6mesBLNplwBW6qAfNByOCj8Wb+5FvIEL30c4jOamI8Du
         pP18dr2tXkGEodW87zx1T54ctrBvkXASs5KZreKrkupnc8pCKMoE5RwaL9ZcEvAxw2D+
         PDnFZG6GQv4EFgR5Cc4EOYPhSp9k2U5PEbRJ2JA76ZuhLQjIX7MwBhaz48c7w8EvBjd9
         WvsvAJV7UuxQ8OoqeyQ2cFII2QU+wyONh8DxEYRuS06Ld3QOTnV/9BCU1r/SjwK/IZsc
         S1hA==
X-Forwarded-Encrypted: i=1; AL+hErGBZhOym+DuWODp+3R508w+NZ5awIFWOlIElcjyGByK3JvmGVMXSOf7VUacuEbJXdQP4Go0ZpJPUUlDNouq01JB@lists.infradead.org
X-Gm-Message-State: APuU4Z/CNfz7WPQWPpWvRPwRcEssdcJLRd5FNLWAeUoqhIffMBVECbhV
	3u7j06aeiyz6oODvcWQYDgw9RPoHoO6TlJh/u/JUghxXisfMNPuqXJo6Jm/p9kRZrG8sAt9wV2c
	aOrAbikqTRaCgwEWli9gSyt4mRuV+ih0=
X-Gm-Gg: AYBFou1CYSBT7JoonbKYDj8w7oIZHxDyevD2+1bxnIeaBkPLbVAiQKdQELHQhJ0tgWj
	xh9KEqg4MElUr76slxVtFKmwmWjieavqVHVvqxcyx/cv67rkkMRIYMl284Flv2oBWeffY7l9cYr
	24gMeRVtym+DF/XBXYoS5p0uHbKiRoo+PfpPjzQKWU4/vU0A4F+UD5uj8PAMAuQf2IGq28kg7FD
	pP0tK6cKNNLTCFc2iL92OYxOtl3UwmATWIM7oko2rQznNAlW56e546CQlMR/9E6CpPSk0tMQOir
	cin0TfaWPLATajlBTDmFcXbel6AoV6PEgWO87poVsh4xQzt+KhKHxiwj0GPcGI69oHV8TVvEy9g
	ZTTvwBEbq7iuALPfUWKZ763zUWWRjGUOlWPTLqRQmYUwbDIj2GPLJ/dvzFA==
X-Received: by 2002:a17:90b:4d07:b0:3a4:7195:ecba with SMTP id
 98e67ed59e1d1-3b12d488e88mr1529576a91.20.1794190983895; Sun, 08 Nov 2026
 18:23:03 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105024106.338791-1-shengjiu.wang@oss.nxp.com>
 <20261105024106.338791-2-shengjiu.wang@oss.nxp.com> <20261106-savvy-invaluable-gaur-7af1b6@quoll>
In-Reply-To: <20261106-savvy-invaluable-gaur-7af1b6@quoll>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 9 Nov 2026 10:22:31 +0800
X-Gm-Features: AclHuK-so4ygy7ZQpiwiv8L7y68F48OdPR-9-HT6EDLnbJ3aW8Kx7LpzrpeA0Ho
Message-ID: <CAA+D8AMxrUb-Pj74wrRn=vEyRUFKWWsR4Eq1LZ2ErsX=rRq=rA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: dsp: fsl,dsp: document debug reset control
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shengjiu.wang@nxp.com, daniel.baluta@nxp.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	andersson@kernel.org, mathieu.poirier@linaro.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_182305_136993_EFDAD45A 
X-CRM114-Status: GOOD (  12.41  )
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

On Fri, Nov 6, 2026 at 8:57=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Thu, Nov 05, 2026 at 10:41:03AM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The HiFi4 DSP provides a separate reset control for its debug logic.
> > Keep this reset deasserted so that an external debug agent can access
> > the DSP and perform debug operations.
> >
> > Also require the reset properties for the i.MX8ULP HiFi4 DSP.
>
> That's ABI break without explanation.
>

The i.MX8ULP HiFi4 DSP has not been enabled upstream before. This series
adds the DSP node for the first time, so there should be no existing upstre=
am
DT relying on this compatible without the reset properties.

I will add this explanation to the commit message.

Best regards
Shengjiu Wang

