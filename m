Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1E7606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 11:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dXInmpLA;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLFD0Xox;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EZF+cxXX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SvrKIGgMsKekaZ4OYmJWDRmxhlP6pZF+z/6bpyikrIw=; b=dXInmpLAbFu8GN
	hTf3Sw7mnCFhpfI+RHjeE+DoWtedTxXwjZskJAKBHQxUzZwg3Ne61+zGnliW7HMbDQkswfZY6DDbw
	ufGIq1AM5JyhUlyrhc0voUTXVbftYmJHPVxkScFwtPNysgsxbUmRNjRPVhyv+65VouxNfhdc0S7IG
	SfTudDgeg236jFdTKqRILtyyCltRjrkE9mdj5ljeMTirqHiaQuGPorKkMeSyL8zpNN/J0ePID6ze5
	cmHOxMSmETVlhv8LbJGutVHskNa1DWAomBMWYLmN+sFWw1yRjTrTBeYQyVLd5+qeFv4J6v5N0HMfE
	5fQKjU+F0uIX2GkpCMbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpk8-0000000CZcb-09zZ;
	Fri, 13 Nov 2026 11:46:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpk5-0000000CZbo-2h33
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 11:46:54 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VBPq3652900
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 11:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SvrKIGgMsKekaZ4OYmJWDRmxhlP6pZF+z/6bpyikrIw=; b=TLFD0XoxjBWwGNSh
	40KMNOgMybCIzGVhmLjmJEqCgTsYKSL87b9ScPTKF/1zuGxpo7YLfwNOw0QMwkQd
	JPRVAg4qv6GNtqUluc8F5Y3hQqV0SH7ROcNcG5wxunqqqPQwumWNtdsxPqVC45Fu
	hWmQC/5ZdcFXfnmRu3yoxBR4v8t6+e97A2lbm/VUrlpBwQoEHr/S99qKLjsYOplL
	vU2t+yvJkLpMVAGziPWUHFB0zLsS45bubJQ6ThuYYBkwv6dpiIo3R5PRb2NtltFW
	vlXZlBoNDguUuSc5mMGLsBlntCBTpXrvoC1oEL7qzma+8zwCpHNZ/aNqoK9QLog5
	4YFbTQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwatcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 11:46:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b18a173e48so662671a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 03:46:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794570411; cv=none;
        d=google.com; s=arc-20260327;
        b=equlensJ4rOmDYsKQ87R2yjIdfxsifsYA8Evs3AbreBj1rsWfhP6MDjKjcWsSupOBE
         N+JC5cebnt9TiixmrbgRYzKPMKsB4lFpxchmHQ67nt5jt+3OgMdRGOaGfNVHMRtIZR+I
         Zgl1RTtyKDph6JUv/TTDITKVpyghnHf3F31awdVM1K46srTLrkkaSJiRZEXA1++N0zAn
         bcPJoYGGOTTw4KGa1qfsE2+Y0fF98BdAByvL7BdydunZ7p+5x9RuqZP3j6wWLmJtuTmK
         QSIjNbiULxDxfHRIHrHdMrJyt77geztUSmvyAGzFKBUNPr5+4to54cAI9BP0PZfMY89A
         kNDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SvrKIGgMsKekaZ4OYmJWDRmxhlP6pZF+z/6bpyikrIw=;
        fh=pq7me6V6I0mfjEPTdyftPEHeYYALCH3lA+wMaSDyzqU=;
        b=SS+I4ld324Vs5P/9KHS/gCJOVXhAEEzI34hQSJ4AZK44drqmcA96M3g0UL8RR0lsnY
         dPzwWk12Ma/lhv3FKnP2yMUiPLnESfEcGCDLpbWaMGb/zHCZu2DoZbcOGxnMgBBJEsNK
         wMsih2JmqybeLXvRhavEpQ+BZlM2iD7OwhRqELN9SuXyvIHtLfDywioqojxVYfPGZVHK
         j/b1M8pclUhMi1XHoeT5k/5jpJiO0u7dXbcs7ZF6tkygf69CJsMIYP2F+3i11wjomZmf
         fkZdQh4bW8hqdUxQsM8h/8TAZMPg1KpGAgM7f6HUb3OtmwoRO58J/gsY1M+wsvebbO3x
         4DgA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794570411; x=1795175211; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SvrKIGgMsKekaZ4OYmJWDRmxhlP6pZF+z/6bpyikrIw=;
        b=EZF+cxXX3BP9Tyqig6pMPSbctLK+/bIpLJGGKl2ozMEA9am+Au5qv2oJE/HPTunYR1
         gLjUSrVyw2LYtMH7VGArRvx5HjzzBcuoMFgnkfzO37UnJMOCdHiqfapkVLZE9hEPU17R
         /kgy7OVA/NAsB4ZhDPHR/IZ3wE23SfHjYkfyS/lTmJvtujSFfSi8bCLy2ytJDgumXHwj
         cD8XEJenqpnAiYqjN1S2kLDAW0Px104hpWtlqZafYU49b8MWpCrKRqA0S1kG7kqY5jp3
         Lrx/11/vmYk8K7vJmBCWVxVhBK73lhmZUdD2746hwEM4FS1z0TNaQvgWaajTxNCbMFWd
         QYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794570411; x=1795175211;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SvrKIGgMsKekaZ4OYmJWDRmxhlP6pZF+z/6bpyikrIw=;
        b=P6cGo0zQHEJID9ZgZu0xc3SfcHXqA4UcZjewN6STk/CFmQGMh34cq1jkMVWTx+Desn
         YUW14iARN4izOaLL4eEzoF6BS7dg3FMYgYXGJHr1+lsiZeCsMOTTpMoundaUbsgPFayb
         ZRGqluaboN6XCfcRSG3WDeT7FuUOJ9NbW2Y6Yvw+2UC1UyFtYGuC1ZeoxFdxenjvCP+a
         rbTTNJ7h5rDqkVl2vxOFgt+C1OD/3EFcVFG/5pnLwH8Xues1wrW46JeS+XmIdV18yXSw
         QSePHQBt7y3AuLjIDARQW3alDdltWJj9RJgFlXOxkCxOGGnRzppEUp5HmGAyoA5Vw6w5
         bVig==
X-Forwarded-Encrypted: i=1; AL+hErFUwaLHFw7LRKKAJD5Bec9Z8JkODlWnege1gDIT5YvNG0c9+9IOHfvhFPjPKSxE4WHzyOwh6Jjvq1Wpcv9FjexK@lists.infradead.org
X-Gm-Message-State: APuU4Z+mVJVUO25ncy9sADBjHVMt7EVBwk73e8RzHwrXzi7RWM83sOuN
	2AqgNfaD4+NdDyiLGVy3PQPbb7Y3as0EUmlYhCLzr/CaWjH3YjE7In17ERfiRwFAPPThayPDp9E
	x7kuC2WFqu/+mxz/JV2emOC7+TOWxKexlplYQGGTHP3ibRleEp9tWYXKX5/zQfzih1yLPMIuf7y
	W1iStfz83tWWx782qXfMtaJTX1dOvuwCfBJRYw7KI+xXevvVnuPMVz
X-Gm-Gg: AYBFou0d4Lo8fYUJHrEymp5cmXPS1I7tX+MMhHgPwRFlu8XlFYoStGJvY5BviOppXbP
	ZSsEJ40xW8u7I7psqsAUDqKtAa69amPtBzi5Rxo3i8/ZSjqN1EnyEHTS2vLeKG6/IscTY2kETaW
	k/GTQn+UjWni/KLJCDBmsC5hZWE8jT+ZByxyVpaZmK/QpzpYHrad2X1i1jMQ==
X-Received: by 2002:a17:90b:1807:b0:3aa:fdad:7d6c with SMTP id 98e67ed59e1d1-3b1b0ca59a4mr2048292a91.58.1794570411504;
        Fri, 13 Nov 2026 03:46:51 -0800 (PST)
X-Received: by 2002:a17:90b:1807:b0:3aa:fdad:7d6c with SMTP id
 98e67ed59e1d1-3b1b0ca59a4mr2048283a91.58.1794570411076; Fri, 13 Nov 2026
 03:46:51 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030215427.488298-1-marex@nabladev.com> <CAPx+jO8sc8gbxNQTjK2tx+1UPLqwwEof3E9vknHNc4kmbeB7oA@mail.gmail.com>
 <51207e63-ec60-4805-bf6a-b10647ee3866@nabladev.com> <CAPx+jO89Z0Z241L1jyB_3sUygdEwGicqT-WfHc6ppG8egHUO2w@mail.gmail.com>
 <c3cbd7ab-e689-4a9b-b311-af43980738d2@nabladev.com>
In-Reply-To: <c3cbd7ab-e689-4a9b-b311-af43980738d2@nabladev.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 12:46:38 +0100
X-Gm-Features: AclHuK-rL4pW5II5yik8DeEMNv996e0C2bZMPptbleGKQZzyv7whzH6lt4_bHnk
Message-ID: <CAPx+jO8=nVBUuOQ==Q66nOnH+VeXur88DetmETe8qmOiS_NCWQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: mmci: stm32: handle mmc power up
To: Marek Vasut <marex@nabladev.com>
Cc: linux-mmc@vger.kernel.org,
        Christophe Kerello <christophe.kerello@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Ulf Hansson <ulfh@kernel.org>, kernel@dh-electronics.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af6f8ac cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=p-LfKV-GAAAA:8 a=sA2VMIrPSRRtzz563tQA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=97BuGM4RKn6GwmfqMd6i:22
X-Proofpoint-ORIG-GUID: TJzHq_sb45sHKDYA1kFPVYwBk96yOOnp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0NiBTYWx0ZWRfX4byESZlKxxOF
 A3CPCUkVKq283E/9J8U4O1M3Ach573sIhiUMb6+k744Cb8gwZynS2/WWQqCS4moPLa56AGuAkfs
 +lfYpPisUBIfG429W9RRNITJvXiH+dmO9N5CyXJ4fwJcHTZCSZpvT7F+W3B+pmt6Uwv3D48MHUF
 +NlFBcATXFyo9cit6VJyWeiE58KOuqTpQHXtNGngg5a0bKlN9bwWVyQr/Vnoi2wHMs9wzhiG68A
 Ic00AXJe8GNTPRKIECbkD6QKW19/v8ukssQyn1MGLoSNlmVikUdvy9I2qwK06ykePSz9MyGRyhO
 IoStbzenRiAEiMiroGgZfhW1HZBzVQniJ0/ddW6Tfs0Kn8C5oqpSTna0EUwLtlGzjhC+RdJ0gpo
 BfTrUUOtAekYofVPOXTpZMiBdKDUm7FvcekM0acxZR4xqM3l4+fgEeMNcp2HYTWRd0opK7QCuNl
 tG+FQArf0Kn6as1qpBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0NiBTYWx0ZWRfX5uwqXEHcVYcf
 loB0T+i9jRHWfVA5Gky/Srllu58Ei2gdPCHalsDoeDSfD3cpfl8uhzlQfpK4Hhezx8yuLFMg//7
 BC51N5yQI75miiJx0qwY/uGf4wtn3tQ=
X-Proofpoint-GUID: TJzHq_sb45sHKDYA1kFPVYwBk96yOOnp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_034653_800162_CA24E5F3 
X-CRM114-Status: GOOD (  24.06  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 7:26=E2=80=AFAM Marek Vasut <marex@nabladev.com> wr=
ote:
>
> On 11/11/26 12:45 PM, Ulf Hansson wrote:
>
> Hello Ulf,
>
> >>>> -       if (ios.power_mode =3D=3D MMC_POWER_OFF) {
> >>>> +       if (ios.power_mode =3D=3D MMC_POWER_OFF ||
> >>>> +           ios.power_mode =3D=3D MMC_POWER_UP) {
> >>>>                   /* Only a reset could power-off sdmmc */
> >>>>                   reset_control_assert(host->rst);
> >>>>                   udelay(2);
> >>>
> >>> What exactly will this reset?
> >> The controller.
> >
> > Okay, I see.
> >
> > In that case, this reset also makes us reset preceding updates to any
> > other registers, for example the clock register. I would not recommend
> > doing that here, but perhaps there is no better option.
>
> Does that pose a problem in the MMC_POWER_OFF/UP state ? I agree this
> would pose a problem in the MMC_POWER_ON state, but here the card is not =
ON.

I think it is a problem, yes. If you have a closer look at what
happens in mmci_set_ios(), I think you will agree.

>
> > If I may I suggest an alternative solution, perhaps we can manage this
> > in the ->runtime_resume() callback instead. If the power_mode =3D=3D
> > MMC_POWER_OFF, perhaps do this reset there instead? Would that work?

Can you try this?

> >
> > Anothing thing that caught my eyes was the MCI_STM32_PWR_CYC bit that
> > gets written at MMC_POWER_OFF. This bit becomes cached in
> > host->pwr_reg, hence it's also rewritten at MMC_POWER_ON. Is that
> > intentional?
> I _think_ so, this seems to be used to power cycle the card.

Well, we are not power-cycling the card at MMC_POWER_ON, we are turning it =
on.

Seems like we could use some support from the ST guys to understand this be=
tter.

Kind regards
Uffe

