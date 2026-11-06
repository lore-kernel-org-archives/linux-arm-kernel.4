Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806A7606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 17:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kQNpM91B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fYklhhhbRSQBfdXX2JpZkjACP3Hz9ptxY00BldJcWAs=; b=kQNpM91BYz8/tz
	AXKkaxgoqyf7uXwcw+4ngSGKFrmOVqAs2zM5VfeoRZr33v6dMyp9xgkH/rsVWyw+W0xtSfoyfENef
	xAPBFdztzFwV+afBBf5eTrXR17ycIjUBSio7k6zCLZw0pGvGHI55rTbRSpxXpSLNHv37C99TFHXdB
	R2JYIivJsPapAq1pnQymkjGRHHVazICEWktS7/E0eFFS2owPGiHEwkNRjAiM+hHFhJ58y9sk73KU0
	M+1MSd6zFFVViC97oIXEOEo/3ScUoIuzku1FuPYavCn5lqzyfMjsY+w4M6yXIax+nVclejIRUunLw
	AM8n9yQ44UPmeCLkmvDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPO4H-0000000DIp3-2N2N;
	Fri, 06 Nov 2026 17:49:37 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPO4B-0000000DIoX-2EwY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 17:49:35 +0000
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-5326cdde017so304888b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 09:49:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987370; x=1794592170;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fYklhhhbRSQBfdXX2JpZkjACP3Hz9ptxY00BldJcWAs=;
        b=O0Ztvc/57J04gS3arKHGJho5m499JXnO+wS5K5hUR1YdthtMSWmNElP+SUMWJ4Y1v7
         47ahevIOW2fY7rHitwQcLprXawVciWXglnZA36ZWcg1uWsh9Pt2qFItwbhKr0mSvyk62
         iT2KVopf2xjQZFbx4q58RFt8eby/3u6sB3mnKn53Ag2ZA3hPHNDp/e21nk8m5+LcxMyt
         2LRuto9Wxsuz8zjTf+BYQXubLgz8MD2bfFAOiZAHeIb/tmn1xdh4JrZF9p0Cn7B/SVth
         uIhB0qGnLAZBh0nUF1UDvu42ZXSyAj8Ipd/IUbEBmk2H6ZbSvHrtBIJR8ADKReJENLWy
         Hm7A==
X-Forwarded-Encrypted: i=1; AKwUvBywkPVAfVoBDDTx12uZ9Ofeg2tzWj7HoM69WGgT4rJ1SOrYjj7ZFtGvfYT9FRPh/+3HOkVEs27v2g/7Mk4EVRg4@lists.infradead.org
X-Gm-Message-State: APuU4Z9a18R7V7EcrZzXJ01MK58nNP8uzIy2SgJrEEy13WecN9KU9O4R
	6ABQ+9SueWqIFJFM2QUJ7sNeZLJOvVdsTJ81TuVfnsFX9uNbNyE55duyz9V5rk8o
X-Gm-Gg: AYBFou2QCi6qYv1QWEf3+43S5Gvp0kRKqs1jWtVlfi4ePprOcKM8JesgTDoi97KW4ma
	7gpVqfxI4x+7aQW4iTGfbNt0j+gdR2s2s8fu5YTrFC2N7UqSMougjMgxFphqWd6jH7FZmRWhR10
	SS6SsXpAa535ebhGs3iaqTmxyPPiW50PtqyiqkqHxFuBMRTK02FlgIzIfau5hoWLisfTYNTH8mH
	uP7xkd5sXLzUi5RFcf87C14QSbWbwpvVWJA5HU9Hx7OsVEh/EkJqM1+7NBqElz7bOA3lciSo1Z7
	qSAJKZwJ6p4d0avgXjUjv/L2WiTToQYD57SxLv/hJpmVKSLnd6tQXTnZSDyIibLz3onMhyf0xzN
	Y9XEIb0T24w+q5FRBgsUeM4oaAFU+mz54HjK9HiEOUq0RnvkCgk3Av2EVelVWbzrAVDZ4SePNd8
	f6qkI4eDT5Rq+XfCVNmZi78kAbhmSOrvzTkUYgHHnynOBT/PR6yQAyd3wz7JetylSsMYsIdGFjF
	K/OaIsfIP9V7sfo8lotpNvE9t0djT0961wcKtbkfzWfkY70Z31b0P8zWyofQWgczraeLozCrzyD
	AUg/yBLzk8eo7jYlrOSvkthQABO3Ql8LcwLns1DcRfHy2VY0k57noQ77Up9Rsy2Mnh4EYSxtMEA
	rcScG+VVKQACGo5EjWzz7gQ5Rr2SweZUU8y3xvJ4KWtpfkFL7u5xOIJBN+mK26HXLcEjxfRkoo3
	9Xv0d2UZafz0PML2md6Smj
X-Received: by 2002:a05:6808:23c7:b0:552:2c0b:905f with SMTP id 5614622812f47-567e0fc6232mr2264910b6e.10.1793987369911;
        Fri, 06 Nov 2026 09:49:29 -0800 (PST)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com. [209.85.210.48])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567e7d8b370sm1974613b6e.5.2026.11.06.09.49.29
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 09:49:29 -0800 (PST)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-8256106635eso422704a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 09:49:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzNfyCPQCFkLSddbTwCOCk75KE8ZzPk2ylAseLUFG7MQqKSKHwKjjkkQw3az1CoLF2oJpgy4VbKKoJVTsRzbSrf@lists.infradead.org
X-Received: by 2002:a05:6830:270a:b0:81b:9d18:75c with SMTP id
 46e09a7af769-85f1cf95bdcmr3174058a34.20.1793987369358; Fri, 06 Nov 2026
 09:49:29 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106-apple-dts-m4-dt-style-check-v2-0-1e715e80b066@cyberchaos.dev>
In-Reply-To: <20261106-apple-dts-m4-dt-style-check-v2-0-1e715e80b066@cyberchaos.dev>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 6 Nov 2026 12:48:51 -0500
X-Gmail-Original-Message-ID: <CAEg-Je96B8OJwSR-3Kg74QCXyyBQ0CxYZ7UpLjvFn+UraDdjhA@mail.gmail.com>
X-Gm-Features: AclHuK8hoZuMZCPNLtXxjvtNoRHB9-OULlZW_Ke3tPYAl1aigN1s6wtlzqMd3Lo
Message-ID: <CAEg-Je96B8OJwSR-3Kg74QCXyyBQ0CxYZ7UpLjvFn+UraDdjhA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] arm64: dts: apple: dt-check-style strict fixes for
 Apple M4
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_094931_601395_B04641ED 
X-CRM114-Status: GOOD (  15.74  )
X-Spam-Score: -1.4 (-)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 6, 2026 at 11:56=E2=80=AFAM Yureka Lilian <yureka@cyberchaos.de=
v> wrote:
>
> Hi,
>
> mirroring recent changes to the M3 and M3 Pro/Max/Ultra device trees,
> this makes the M4 device trees broadly compliant with
> `dt-check-style --mode=3Dstrict`, leaving the same exceptions:
>
> - the property-order and line-length issues in the generated pmgr nodes
>   are left as-is
>
> I checked carefully that the modifications do not cause any functional
> change in the compiled DTs.
>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
> Changes in v2:
> - Also fix indentation related dt-check-style issues (mixed-indent-chars)
> - Change the ordering only where the issue is still present against
>   current linux-next dt-check-style.
> - Also fix any remaining line length issues in the t8132 dts except t8132=
-pmgr.dtsi.
> - Link to v1: https://patch.msgid.link/20260924-apple-dts-m4-dt-style-che=
ck-v1-0-3ec651d75baf@cyberchaos.dev
>
> ---
> Yureka Lilian (4):
>       arm64: dts: apple: t8132: Fix indentation-related dt-check-style is=
sues
>       arm64: dts: apple: t8132: Fix blank-lines-related dt-check-style is=
sues
>       arm64: dts: apple: t8132: Fix line-length-related dt-check-style is=
sues
>       arm64: dts: apple: t8132: Fix ordering-related dt-check-style issue=
s
>
>  arch/arm64/boot/dts/apple/t8132-j604.dts  |   3 +-
>  arch/arm64/boot/dts/apple/t8132-j623.dts  |   2 +-
>  arch/arm64/boot/dts/apple/t8132-j624.dts  |   2 +-
>  arch/arm64/boot/dts/apple/t8132-j713.dts  |   3 +-
>  arch/arm64/boot/dts/apple/t8132-j715.dts  |   3 +-
>  arch/arm64/boot/dts/apple/t8132-j773g.dts |   2 +-
>  arch/arm64/boot/dts/apple/t8132-jxxx.dtsi |  19 ++--
>  arch/arm64/boot/dts/apple/t8132.dtsi      | 157 +++++++++++++++++-------=
------
>  8 files changed, 109 insertions(+), 82 deletions(-)
> ---
> base-commit: eea4f3b5e9e19389af3b99af64cdf7352b67c298
> change-id: 20260924-apple-dts-m4-dt-style-check-6e1f9dc92807
>

LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

