Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7DD60A262F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 23:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HfyfrQHp;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JnTTdhMB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yMRabWLMCSHEq9av7y6ywR85Ullm7taZPfMTAVGFuHY=; b=HfyfrQHp6cDrUK
	sSosm6vncrO7WOuqPsCiNOtJtCXu8PuG/J7l8ZDKGMHLy+fqooGo6wOrZ0tcc9WDBkJ4zQz/aMU6i
	hCkbxtgoKnICpP9gFRM6fX1Yoni+FJWf0fGusFyLKzknPiyjrfnruHQtzhSSMWeS416zCZvzcVhmy
	HfTjsP7UCJMFCb3TGVT+GB0tOYABR4lqKx1P+tw+7yTjkBqDxxrm3vUh8QaJU3EN2IvKR03bgen91
	2+y5ekA2Yg3/RWuyoSxdLrHCqVxc0OMrUPljVk792cfk6A+iTfTOLIMdF04CdLCBkIKkJMcFI7des
	0Fu7UZ/tfUXj0p8Tva6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5mk-000000046ZK-1sXi;
	Mon, 16 Nov 2026 23:06:50 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5me-000000046XQ-3FXV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 23:06:47 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4919a880834so2061800f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 15:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794870402; x=1795475202; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yMRabWLMCSHEq9av7y6ywR85Ullm7taZPfMTAVGFuHY=;
        b=JnTTdhMBr/URuqr5J5FE27sXKppYj+d6W1dXSnn+lt6eE19bHlgvi1mZ2VpRbmSZ2L
         /IrsFX3iEpY0TIK2x6yuEb06NmXrijMaVgem9njl/WMQVoBInaF1vOHgBpb5Q94wbD04
         sScpFNe19cXRPD7mLoy4CK0oblRDrKpM+i2zyRchbtCVIX5SqB3x3Z4EwZxnEKAM/8tH
         jBl3Pf59XEpuP4CmfozQJsAIh03aWGv8jfxNVRi8q0aeOwHGfEp6FtFXYwhMDnCvXmC4
         /sIyyLqkbDv2speqkei/dnCHgDaEx0temiPjapj8sy2GiSGzJP+Zm4tzQCEXsYv8K5im
         NS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870402; x=1795475202;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yMRabWLMCSHEq9av7y6ywR85Ullm7taZPfMTAVGFuHY=;
        b=wgfVIG9JpMZ9ZS12UxVVtobzB/UbtU56hSGPJvmngFKrDrSug76w5WNK3H3vy+2qvP
         2SHl7WdDQamAHYsFlSCIx+MnBH+yz3aDf7Aj5IOfP8IC69ECLF3Go424fWvMgtqV28/n
         v6PBAG6exovj16Bpm9pbVYzyzroLTJnTWeNB6sCgcYgRcxraZdCG638rfYYKBzH4QTCy
         /clzDl0TNm1afgXGykjEamwQNcTrDQ77Fn0jh+0AYtzwxZqhRkdFv5WKVMAEncX2mK9P
         Xmph5zrZvQ/90oXGuRWNZ1/M44HM9iCn21E/f/LpIvmL58iwRvqibQHozNqziU+E7VZP
         bK5w==
X-Forwarded-Encrypted: i=1; AL+hErG5HKPR46Pu4/OOm+9/a+W3JPethzjxIcIphsl708Wqu0ZUyWnSpDcbqSg39bR59eQd4axrg2yGsH+TZCd464Cv@lists.infradead.org
X-Gm-Message-State: APuU4Z9QZVEQqObrNBGyqRLd3cbIwq8y+gEKl9zwQpyR12eTf/9itT8P
	F2BIssQzqnOUpLVARJUMR2/AIbB+foo/5PAu9/LXDVhDdV/SjoulToHF5A5aIINN4Cg=
X-Gm-Gg: AZFdTZd82kdjSwwWbq4AJGJ1ca8xJrA10u+qiAECNhbeRe2stRFxtD90Yp2wwcTA7VP
	2HkRxmFpHY2FuA5M41aYrFoZ/h+NjbCDir03DhRecgLxNZvbYB98rpJeIliwPvy4hszLptyLSTe
	dD2X+s0pbEP/FHAxAdD7/KvbzOGFJCCSvZ+MjPX8l16PiqZNOn2dckFSWVNIJg/CV32fSUQCpzo
	FqHtq74a9cwin9PV6MeucNWBOMWu2E6YEBHHx3xHh9mASLCCJuqLeYyaBdas6yP5vTeaYidEbn8
	3x0CtZ3q1jUGFPGaCND00TlcBZh3TU8U8gleKHIXYrEoul/mSfu6ONTkU6P31YwNoTTWBqL8gDj
	9WI/F3oRY1qui19XhJePWOiP6ceHzXiZNcYqAIIDHeg3E1gZK6zsK5rtjgAogavEzNpP83pQNBK
	hP9bJcDJJaWCZ2BX0/whJJcnra4QyO2nDcEG750yQtVZyr5Hx4O8wxA1W10FFkBUyYlt0AWd2Y1
	G2mHSZmxj6TQ+i7mfBeLsdc/MbVNGdau06dmtBFHJePrr+jjmcitimjd2sDa5peavd5DcicqeEg
	C/d/UnhfBsSe6V3nEo0o7LJ9KNT6gfAE
X-Received: by 2002:a05:6000:2288:b0:49c:6a45:ca33 with SMTP id ffacd0b85a97d-49c70ed923amr27070236f8f.9.1794870402452;
        Mon, 16 Nov 2026 15:06:42 -0800 (PST)
Received: from [192.168.3.100] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c77393700sm24359908f8f.18.2026.11.16.15.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:06:42 -0800 (PST)
Message-ID: <0949591a-63cb-4bb3-a7de-cf59ddbaafb7@baylibre.com>
Date: Tue, 17 Nov 2026 00:06:40 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] ASoC: meson: gx-card: add support for audin FIFO
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
 <20261018-audin-v5-6-4b8cc13a1b22@baylibre.com>
 <CAFBinCA12FvOi=9gB1xj3MDvNWstx1N4TtyyrrndJ_JT5eLX=Q@mail.gmail.com>
Content-Language: en-US
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <CAFBinCA12FvOi=9gB1xj3MDvNWstx1N4TtyyrrndJ_JT5eLX=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_150645_400508_225CEF88 
X-CRM114-Status: GOOD (  10.92  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/15/26 10:28 PM, Martin Blumenstingl wrote:
> On Sun, Oct 18, 2026 at 12:18 PM Valerio Setti <vsetti@baylibre.com> wrote:
> [...]
>> +       if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "gxbb-audin", "FIFO"))
>> +               return meson_card_set_fe_link(card, dai_link, np, false);
> I suggest using the "audin" prefix. AIU / audin seem close enough on
> all supported SoCs that we don't need a SoC generation prefix  in
> there to handle this differently.

Do you mean using "meson,audin" instead of "meson,gxbb-audin" for the 
compatible?
If so I'm not sure this is allowed nowadays. As far as I understood 
"meson,aiu" is a sort of legacy naming. 'writing-binidings.rst' says

   "DO use a SoC-specific compatible for all SoC devices [...]"

-- 
Valerio


