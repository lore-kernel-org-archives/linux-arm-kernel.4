Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1129F606A682
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 20:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u0fGtHIZ;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Bzgq5Wy3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sUl61wz2FooKjKoGfr6HcICrxyIas91AkAkxcmRZVuk=; b=u0fGtHIZ8nVXN6TeiDYqJNm43X
	3b7K4n/DGwGpXE3evd7YSUIb+aCvBhLO3RZqSGjunwSsBq7xVZDwe3GEK1nXg9191Jw2LwEqkIt7v
	eckCkyoKk1MQWcXiCWxtcI/EvU90HFzu64WlUnQsaQ2efg7BMwjSIpV4rC6/KMsYZ5c4u/+sC7NQ1
	1ZmRxv260YDa91776/e+L5reQJ5yW0gD5fL6iTeXQKXDzWck+r27dduApXa/LLJDTmyyU1EaHIC2R
	AU0hjjp/Jf2IAOCI7wiD2OP/wJNfW+1mtJRk7r0hrt7VEVmGO7Y3GH+3OgjMCyGDSTXKu/8lmIQhM
	olHWxVSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWIMZ-0000000B5nA-3cCt;
	Wed, 25 Nov 2026 19:09:04 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWIMW-0000000B5mO-47DC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 19:09:02 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-386cf1041cdso2048810eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 11:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795633739; x=1796238539; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sUl61wz2FooKjKoGfr6HcICrxyIas91AkAkxcmRZVuk=;
        b=Bzgq5Wy3dv8zB7kvPmHRBrUoZonWGU6K43QKL7wYek0q5XjYZVrNY0/xscVJ+UAIPA
         PL0+S4PmlsxL3G2GM5fugGe6qzb5iwj4RciyRJZjc7gwQwDfyez3x+MkDAU4bJPEVgPb
         +J986KClMrHU6LzrvKtuyUbw82tPacKBjXisM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795633739; x=1796238539;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sUl61wz2FooKjKoGfr6HcICrxyIas91AkAkxcmRZVuk=;
        b=UbpRcpnKxwVqsLtcaahCju3kP/QVopFbjVtzIlwLOPmZsUWiP63n74FzXUELMgXN4o
         +mzks0KAi8DXOgwGzdOW4MrjXUONBl64WxMIf1YucboYvmS5tlKCzYzrVP+ZYuzkZVC0
         j4r34nCSkqb2bKVKFkRQ/rnK1n/mUfmx4kJfY2B+REC8cF/WYWSEw0YqKpE5vFv9tjkr
         rFQXgTFFX0Hqk4jCM0/lVLUM8M2ZCExVKQZ9K56CawW0hbZoPk6JrDAeqzPa9djDbOGD
         8TC3dQotCMX/SVfJ3Puxb9BBi2BPO+lgwILk7WRQyzYWvwNOq7tqiMofI/aomiFsQpLI
         /Q8g==
X-Forwarded-Encrypted: i=1; AL+hErE1kkIImiah8auFpH3i8ve/STxjNOSQOJzlyL/mThKRc+6etZpw+wMwml1NrHEKehX2Xzmx9r1oKtLoPgqt6jQ1@lists.infradead.org
X-Gm-Message-State: APuU4Z+teIW6ohOZc/1iWWlKh9dW8vcsag2a2wbeXvEP/CGuVpEN6Mj+
	3YLAhTVIz+Qv0oFL+sh4dFbxeB9O0UAytn4FJMpnsJ3/S6PZR+9VSmnxNdDXYAIznA==
X-Gm-Gg: AZFdTZdcQHKPUuVF9ByvuItWOa+j2DUgJYMU/DTsh2hOkh4YdfSOaPLwHfXmXk/wLpR
	9yS0a8/DGzSKtVS0MMJMG5/zr7u/V4yp5/l9rIFpfiJK5GcNg5QU8jb3lswRmIyi4bPWTZjTSPT
	0DMBREefnzsRQEyFwtQAmllvQC8oaBerneb61ho165An7JH/tuDJPTiOuVS58t1fyuaw86lKBuy
	rtd4Ymc7DlmkI2rjZdDYsti/dcgFu4BzXSi5z36bdMMWKkp1iHUVMFdZj8iSfxNBXzVvkv5/VzF
	RWkI4qpin17z52q/75mNSylAwcfuLrlmnPuxjBYKBlxlsqwv4TrEOi39CTRCsNw4tao662bEQl6
	40aORMeqrcscfQvbZ2THCuoCSD+X4o330eM2tBLSp6Th8SefO2tw1+sIeHfLO9pA8xgpS1sQyYX
	TnNbxuLF9H5PfbY1DA6WGDjVVTW0ZIMCspsapF5nJXbb1Nmo5rTMneC7t0jiQ44/zLF5/onaDlF
	UYo5JfXnXwDTDlPYPbrTmXZn9NZfcdjNim2/0oFkTQQJudk/XduWWetz+MsycxlNernpJuCktVV
	KcBsuu1zmUooNop0QEukvPJeI0aUiDZ4d7ztvzmixVsYEGBfOAK8RRayOtWP6SDNHIg=
X-Received: by 2002:a05:693c:87d6:20b0:386:bc19:6a30 with SMTP id 5a478bee46e88-386bc196d10mr7852852eec.20.1795633739073;
        Wed, 25 Nov 2026 11:08:59 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:d0a2:f616:6ba:a1ce])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-385665f21aesm68043117eec.4.2026.11.25.11.08.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 11:08:58 -0800 (PST)
Date: Wed, 25 Nov 2026 11:08:56 -0800
From: Brian Norris <briannorris@chromium.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org,
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>
Subject: Re: [PATCH 2/9] dt-bindings: soc: google: Add Google Tensor CPM
 binding
Message-ID: <awcySI6q3O3_M7Gp@google.com>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.2.Ib692ddd35c1dbea1757d9b1db6c1c7e938fc4ea6@changeid>
 <20261028-rapid-daffodil-rat-0adc6a@quoll>
 <aulIoq2oVjJ3DVzL@google.com>
 <d4a430de-715a-4936-8adb-35ff57a52b5f@kernel.org>
 <avZkfg6WMlMzOxpn@google.com>
 <72ef7ef8-acc8-4ad5-9c09-76d9e944bf5c@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72ef7ef8-acc8-4ad5-9c09-76d9e944bf5c@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_110901_052544_4F61376B 
X-CRM114-Status: GOOD (  31.91  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Krzysztof,

On Wed, Nov 25, 2026 at 08:07:57AM +0100, Krzysztof Kozlowski wrote:
> On 13/11/2026 02:14, Brian Norris wrote:
> > Hi Krzysztof,
> > 
> > On Thu, Nov 05, 2026 at 07:54:22PM +0100, Krzysztof Kozlowski wrote:
> >> On 03/11/2026 03:36, Brian Norris wrote:
> >>> On Wed, Oct 28, 2026 at 02:19:23PM +0100, Krzysztof Kozlowski wrote:
> >>>> On Mon, Oct 26, 2026 at 02:43:40PM -0700, Brian Norris wrote:
> >>>>> --- /dev/null
> >>>>> +++ b/include/dt-bindings/soc/google,lga-lpcm.h
> >>>>> @@ -0,0 +1,54 @@
> >>>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> >>>>> +
> >>>>> +#ifndef __DT_BINDINGS_SOC_GOOGLE_LGA_LPCM_H
> >>>>> +#define __DT_BINDINGS_SOC_GOOGLE_LGA_LPCM_H
> >>>>> +
> >>>>> +/*
> >>>>> + * LPCM IDs of each SSWRP.
> >>>>> + */
> >>>>> +#define LGA_LPCM_CPM			0
> >>>>
> >>>> What are all these?
> >>>
> >>> The binding doc says:
> >>>
> >>>       Each reset is specified by an LPCM ID (cell 1) and a reset ID (cell 2).
> >>>       See <dt-bindings/soc/google,lga-lpcm.h> for LPCM IDs and
> >>>       <dt-bindings/reset/google,lga-cpm-reset.h> for reset IDs.
> >>>
> >>> and
> >>>
> >>>       Each clock is specified by an LPCM ID (cell 1) and a clock ID (cell
> >>>       2). See <dt-bindings/soc/google,lga-lpcm.h> for LPCM IDs and
> >>>       <dt-bindings/clock/google,lga-cpm.h> for clock IDs.
> >>>
> >>> These are the IDs used in the firmware interface to talk about these
> >>> things, as many of the SoC resources involved (clocks, resets, power
> >>> domains) are grouped in this way (by subsystem (SSWRP / LPCM), and then
> >>> with indexing within each subsystem).
> >>>
> >>> In reading again, I see that the definitions and explanation of these
> >>> terms and the SoC organization are split a bit between the pmdomain
> >>> commit message and the binding doc. Where would you prefer I elaborate
> >>> more? In the binding doc, the comments here, or both?
> >>
> >> I just try to understand their placement. Bindings should not be in the
> >> soc directory, except a few things without clear subsystem owner. If
> >> this applies for both clocks and resets, maybe this could be firmware,
> > 
> > Maybe firmware, maybe power? LPCM is "Local Power and Clock Manager",
> > and I believe there's essentially 1 LPCM (microcontroller) within each
> > top-level power domain.
> 
> How does it help you to have LPCM ID in the DTS? It's derivative from
> the clock (or could be made derivative)?

For the record: in v2, the LPCM ID for clocks *is* made derivative of a
single-cell clock binding.

More info, in case you had other adjacent non-clock concerns: I settled
on dropping LPCM IDs (and other firmware IDs) from the clock binding
(and DTS) in v2. And LPCM IDs moved out of include/dt-bindings/
entirely, even for resets. I thought this addressed your feedback (after
a few weeks of waiting for further response/clarification) so I sent v2.
I'd appreciate a look at whether v2 is more to your liking.

LPCM IDs remain in the DTS for resets though (as documentation [1]; but
the driver never has to inspect them), because I still think they are
the straightforward way to describe resets, and there's much less
complexity that might imply any "risk" here (vs clocks or pmdomains).

If you look at the v2 reset driver, you see that just like any hardware
indices / GIC numbers in typical reset or IRQ drivers, the firmware IDs
are a simple address scheme that are passed directly through. If I do
the indirection you're asking for, then:

1) I have to add extra indirection tables in the reset driver and
2) the driver will now require per-SoC handling that otherwise is not
   required.

I see you had a separate semi-related question that gained its own
sub-thread. I'll reply to that separately.

Brian

[1] Aligned with Chen-Yu's suggestion:
    https://lore.kernel.org/all/CAGXv+5G5z75HGP8nv_i_nwEeSd3qkvyL_h_MYzV_XPT9BpR4jg@mail.gmail.com/

