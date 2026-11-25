Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5609D606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 13:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EPSRjMV6;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XP1uVxlM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=goBVi6pE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7zYC14kkeeAydLtOuE3dZ/lyIfuyBLa6WSEsS0ZThvY=; b=EPSRjMV68oGV/w
	5TaSb2dPnCppl8C2sKCdQiMyN3KbxBg6zO8WP5TfkgzozKXFOJjvkw99j71Qyy2mV1BPR6j8Mr7mk
	xcmLaumX+Juw83LwZ4pknlnpfHTKOsVQQn8JK7fHpd44V05pn/tZHGp2sSKD7Z942Cc5zHDwItpdu
	mImORmemL6twZUSSsrPyefTuf0b0DuThhjVbQAKjrXm1b8ljlUN10LO32jBbCbD9NW40Ieaf1xk1y
	auzRIZjFM18UFDrsQzq403O3noPHt2Fx5dGAYBRYKjOFGMr71GnXqr1jjuEglr3SHGX8s63LorDQN
	2pMmZ1xqXG25pHA/16Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWClE-00000009wOC-1ztE;
	Wed, 25 Nov 2026 13:10:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWClB-00000009wNq-1bIz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 13:10:07 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mT784034201
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 13:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7zYC14kkeeAydLtOuE3dZ/lyIfuyBLa6WSEsS0ZThvY=; b=XP1uVxlMIAT52RJ6
	U9GJgrDIM6cDgB3qq5Udzh/EG3fWMBTEkexAfef9+HRsup89OlthsGib/Y58NBkT
	3vzJ9UPhFt0O3P87OPZda+jjqojkoPp6Htp25iWkVaHhd5CT88vfjLtXsZW0XEJc
	R00lw8tuXWN9W8qwS3h2Um9zBNl9S0qNUWQE+ZMBdzSqDV/9N+tWyccR1ZKGs65L
	Ug0Q7R+VEJlPmGiML16PG5Lme1zfEK02jbLRu/NyV9ymzRfMrG5e2u129tQOcWPu
	raeMT1soGb1sQfhkbbgRszux6zuqrU8b6lxp8ie/HuTtqah7MUWjQIFyfl9eZgD9
	Itib/g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbjwc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 13:10:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0a7cbf164so4783510a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 05:10:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795612204; cv=none;
        d=google.com; s=arc-20260327;
        b=n2aXBcoodRgXE+//rGg8zos5IpdL52n2wFaix4GpsAGtQjzWXvogE9EbFYwnccR9f4
         gIn+Do9L2guud7nvlgwxQvRhhy22mxdquZpyfgxm7D1P5HmenAdmHYVj6B4EG27xOi0l
         IT/EzX512OonOVx817JnQAO5e3zpaxSgrHgog4V6EXgNDbeI26pHpy+IRr5IuR6DqjR4
         p54hZDDaO7PD/juYnUVNpSsLWDuDeDauEhHYgLVJOLVKIotZm6kfm7o5KpjSAUo/l66x
         ftumuXai7kGZJsVv+WWhELmxZxYc8ApTo1glmYzXoq1pNVk/dZj70+qrS3fEZaDvvaH9
         HzUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7zYC14kkeeAydLtOuE3dZ/lyIfuyBLa6WSEsS0ZThvY=;
        fh=ym3QBFcR7EEBFNN3lKp7mkVx+OkqEQFOVhVRaYG29Y0=;
        b=PAcDwmfiU+LOZMaabTYqIU8CbTG9rGkJxM2aru1P5Tp6d0FdKG1OX1GIfiXRy5WDhp
         SRiLp6y9bwyyyw88hsrC8Lr6B1/luTY7Kxs8lb2sdrWfjiFpG8dOVWAHpV+dgb7BxSke
         3sEU5p9oQsurGE37gkZQRMIlRKD1jADkPiWRGWETBOQE7EItUGZDxrhEdoWyz9RL1LQ7
         Ak4La4ACP9V8Ex7gQXoOESUhilJbjgJhIuhL5ElsKPGVVgF8hBBsnxkpuWk2dSDK2GjF
         cs/IKkZ/VhI3w1xcNp1mI8I+xzrVJuMcoauYa5t0wGUXaM1/aSQKtby6M7xU69MUNuHO
         ubFQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795612204; x=1796217004; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7zYC14kkeeAydLtOuE3dZ/lyIfuyBLa6WSEsS0ZThvY=;
        b=goBVi6pEBoGuLPC9IjumJlXzBQSqkd1T3RyMCHIgS2KuYOiAbd+hCvvrVsumBKmMOg
         nlIiZQNJFI8orYC9CzdPI73antLFiRj0s0zNq1MwGlx86gW5El3vHLPW3dardUIlZnSi
         tbsuLD37AwyuGJe/T86qu9Gq3MGTy1a/bIB8f2LQGs67hjoTn5idgNb/dtUMcmS/7j8V
         t3i3tumfPRsL50nQ2vpFeaXl+n32RuvEz1j+yPWdP1inNfZNEfGbxXhwUSJv7iq/BaXm
         +ryMncFw9V9XUDI2fsFgo+4BMNi9+T2mblfoTurW16b62uuFkrzpNaUAQagLqI6fL6eA
         kXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612204; x=1796217004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7zYC14kkeeAydLtOuE3dZ/lyIfuyBLa6WSEsS0ZThvY=;
        b=ITMOvpzz0lrTWBh6MXuc85ZhlCCtBo2osvLMCDx00yenfJYEjPppgiX0XoNDDvTQlG
         ky+qXcQmAi4OndqqJbvrPBCRUFg5eXEo8ne0ovdnKHcmjfv8EcNAqZrvpzfaglO3MGbt
         4OcsVZJ22dyOx9ezR+x8CQXgz+jHachnb6PcvWR7fL4y6ksM7jIwb0zq8Mq3pDhVwmzw
         RE/ZseX26htmCVT9naiubd/h08njduletViQGkjLZZ/2fJsVpPxqW16VyF8Lx37FtuoZ
         yrLAxZ2KB6XLPvZnYfMCAcltaFa9k1Lv/WsM0uxo4qgV3zcBI4dw0x4gQk75SQemw2lx
         QQ5Q==
X-Forwarded-Encrypted: i=1; AL+hErHkvh9oKt3riDIST5E4RDd7KVS6MlVLcpbHqD98/77pC0VS+XFxl5lXPelsvPMSixLHAae24LF42yeNjYEeSu1W@lists.infradead.org
X-Gm-Message-State: APuU4Z9lIyq7Wg2mjrdK3cNgEcW/UyemPO7jcJDdk6FvsD0NFixPlEL0
	PvaYSdL504y5LRSmLnzQwZ67uOHxqMa6sL4zoTSRzUWPQjhKanNufDGuPiIlARUqHrXfWQbqW8m
	xGzAQy2YzYaeeODf7XBiOadGE6A2dh0vNCP/3IAU6YFldhNjoC2RmLjNXiE9Bj3g8ZyaunEhaFU
	9gYN7gpC5eJlWK7T6oldiMsqQ9iwPDkAOTdYg1Xebacn0dlqU92sMU
X-Gm-Gg: AZFdTZezjzncR9y36pO7rii+PTtOcxN0v6+snnEXzPvqUjtIOA5thBmlsvx3H0Ayhlf
	98ADJFV4Q07e64jK7VA6jPeR6GA98YlI+zIylEleSk+5fGFXIfdoR15cl79/7jg4EHNncMI2bRF
	DO9Vv4+7DQt9gAQh8m/YFp28gZMmXTdRvGdt3GYyt6QLogWWTv73rPAvFC1w==
X-Received: by 2002:a17:90b:5346:b0:3b3:ab74:74f7 with SMTP id 98e67ed59e1d1-3b41c955bc5mr17028247a91.39.1795612203985;
        Wed, 25 Nov 2026 05:10:03 -0800 (PST)
X-Received: by 2002:a17:90b:5346:b0:3b3:ab74:74f7 with SMTP id
 98e67ed59e1d1-3b41c955bc5mr17028202a91.39.1795612203470; Wed, 25 Nov 2026
 05:10:03 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
 <20261022-psci-fix-v3-1-9ce2133c5659@gmail.com> <CAPx+jO-rMeg8BvemcMUcC10enjt0dkqWvsK+uRwc75rWpLXhMg@mail.gmail.com>
 <CAAq9HC4doEs2v=aW0-tR+ARD8a1OGes8xDi2BV=T7m40YFBmww@mail.gmail.com>
In-Reply-To: <CAAq9HC4doEs2v=aW0-tR+ARD8a1OGes8xDi2BV=T7m40YFBmww@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:09:52 +0100
X-Gm-Features: Aa3M54oxcK6RC0Uj2-RqU1IkNrdUwbjccr03Fd36W2QS4bujwoCnie3WcicoJCs
Message-ID: <CAPx+jO9CHiWfHNqApccUb=srYec+Ep-bupo+iQteu9ZPVZ9MYQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: psci: Add skip-suspend-mode-switch
 property
To: Reza Kurniawan <imkyufie@gmail.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Val Packett <val@packett.cool>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX6da9gV6ROGMv
 HJ8dq+lFC81LJd66vEpBIOLNAbEaL5W5Op2V1Tt7mvg/j8iRe6Mgsn3uWxhkaKxDii2Mqvf7Jvb
 kkyJV1oxzN9+dL9Hp9vMYPNJZKu8+Yo=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06de2c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=UY4Qpe7uAAAA:8
 a=gEszbayXw1Bg4_vTXsgA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=Dz9CbhmWzz49oM4s8yQO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX3WsSthoxF5x/
 IeBuTgwnmT21V2C9yAdMxUE6l6hKfwKy4Dy+TekIoTWXIc7AvMq7RRPXfdpHfXPiE/ti4KKpzJE
 JIYv57aT/RDSZ7Unf9gDe+L0rPv9KeHpaE4Fbmn0h66tU+VpBauqbX2FHevSwVgs2Fl8OnXHiru
 pIZ7mdZ++NCKI6VeFmFiO6NzjFXZEP7veWrwmOUn1iu5tnl4rv9Z2MnIe8dlt9+tI6P7AzowNpm
 12L99QBZLKz5bGU138E27de2kL2I56mUe4Y7HgdEkVwGgtl28PmsyT6SRi0rxpZPLFTRYfTrblb
 UefQo9hbsAjifJDLBPvapBYQ11L4BVafzGkn+Ss+oSy7qmrBK1/pyOkKsxBofi5C+2KlxxdLNM1
 Fzsu0yz32KfRbVkogy4dkVQj4w6JXtBErJ8KrwujZyfCay9FEsw9GbVuHru3s74jx6jxFMJVRSi
 NwIKOLrDLokYkea5aAw==
X-Proofpoint-ORIG-GUID: 1KRbOuObg--T_80-CFbYjAGf7UFWsySF
X-Proofpoint-GUID: 1KRbOuObg--T_80-CFbYjAGf7UFWsySF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_051006_054791_8870A6B3 
X-CRM114-Status: GOOD (  40.87  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 7:15=E2=80=AFAM Reza Kurniawan <imkyufie@gmail.com>=
 wrote:
>
> On Fri, Nov 13, 2026 at 8:10=E2=80=AFPM Ulf Hansson
> <ulf.hansson@oss.qualcomm.com> wrote:
> >
> > + Sudeep
> >
> > On Thu, Oct 22, 2026 at 11:41=E2=80=AFAM Reza Kurniawan <imkyufie@gmail=
.com> wrote:
> > >
> > > From: Alejandro Tafalla <atafalla@dnyon.com>
> > >
> > > On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI_FEATURES repor=
ts
> > > that OS-initiated mode is supported, but every PSCI_SET_SUSPEND_MODE
> > > call is rejected with NOT_SUPPORTED.
> > >
> > > PSCI provides no call to read back the current suspend mode, so the O=
S
> > > cannot tell which mode the firmware is operating in or why the switch
> > > is rejected.
> > >
> > > Add an optional flag that tells the OS not to issue
> > > PSCI_SET_SUSPEND_MODE on such firmware.
> >
> > I think it would be nice to further clarify what's going on in the
> > PSCI FW. If I understand correctly, the only supported mode is the
> > PSCI OS-initiated mode, hence it's always running in this mode, right?
>
> That is correct.
>
> >
> > This is clearly a violation of the PSCI spec - and I guess updating
> > the FW isn't possible at this late state, or is it?
>
> Just as Val stated, it's not possible sadly.
>
> >
> > >
> > > Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
> > > [Reza Kurniawan: split out the patch, rewrote the property descriptio=
n,
> > >  renamed the property]
> > > Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
> > > Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> > > ---
> > >  Documentation/devicetree/bindings/arm/psci.yaml | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Docume=
ntation/devicetree/bindings/arm/psci.yaml
> > > index 0d04389c81..2eee38d155 100644
> > > --- a/Documentation/devicetree/bindings/arm/psci.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/psci.yaml
> > > @@ -98,6 +98,19 @@ properties:
> > >        [1] Kernel documentation - ARM idle states bindings
> > >          Documentation/devicetree/bindings/cpu/idle-states.yaml
> > >
> > > +  skip-suspend-mode-switch:
> >
> > Maybe a more descriptive name can be found?
> >
> > osi-mode-only or broken-suspend-mode-osi-only?
>
> I initially settled with a similar name before (with 'osi-only'
> phrasing). I ultimately went with 'skip-suspend-mode-switch' because
> the root cause was only due to the mode switch not functioning
> properly. This property doesn't do anything regarding the mode the
> firmware is stuck at as it's only fixing the failed call. Normally,
> the driver sets the PSCI to the preferred mode at driver probe (OSI if
> supported, PC otherwise). This property simply skips that part and
> assumes the FW is already in the preferred mode. It could
> theoretically work for firmware stuck at either OSI or PC mode, as long
> as the platform shows the same symptom, It is mode-agnostic essentially.
> That being said, I'm not completely against the 'osi-only' phrasing.
>
> What do you think of the above rationale? I'm open to suggestions.
>
> I admit that the word "skip" here isn't really helpful since it counts
> as an implementation detail. "broken" should better describe that it's
> a quirk.

I guess "broken" deserves to be part of the property somehow, to
clearly indicate that the FW do not follow the spec.

People have different tastes and I have no strong opinion in the end.
Anyway, I suggest you to respin this to clarify the commit message and
to suggest a better name of the property. Let's see what Sudeep and
the arm folkz think of this as well.

Kind regards
Uffe

