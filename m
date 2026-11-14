Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A07606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 11:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wwxH2/E9;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PiBqRjkM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L9GpcGKG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1/1WLzYMEGYQaXjv2m5ge60WfeRW/hTmJOCmO45FGgk=; b=wwxH2/E98EDYuf
	P0L2/RVm5PbZgYxxF9RRBawOseQs1IZeZbQZLKGfGFNqct1tL1PnPWZRcG3LRQRg9850CRMwnmmky
	39+WaWaJOcyEr9isOZwk5cye3fblX9d7S+nBbY3nrkv9IzWyfYtsg9MAGqfFlxK/4Uj2husOHV3kH
	VYpFwnHfNxyWXfIjHEQPlRYoyrBMRBkHql+SMV08taU+TWytbPrKxqtkxsNC9sQPlEaltB+5v+GNx
	5FkfIXxxGprxvj0zwby2jXdiC1RvfwDWFtKTwbmSk0yU1fJDXvn3x4zFsKDsmvtQS/QdRKebD3oET
	gjvvMiHSSf3RKPfWrhgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSCH4-0000000FvIt-1pNh;
	Sat, 14 Nov 2026 11:50:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSCGr-0000000FvEq-0oDW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 11:50:15 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wjWh3650427
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 11:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1/1WLzYMEGYQaXjv2m5ge60WfeRW/hTmJOCmO45FGgk=; b=PiBqRjkM9SPylZBt
	4LD9BvT6t4t8REbdmGqwIYc/Ollq5iLejeb8xDGD+RFr59mzoaWq3uhTy7UYITKs
	MnhtYpWRbdBwtAH68Y5AoaaBkSudeMnzZPWJwsf5E2IiNQnBpHYeQdBPQHWUHhTS
	9XO4mqOnpn7qJSfIpZ6SW+WJ5NIJGdRdNataVC+Z0zxpeV9BJV7TjD6CNNT0L3s6
	01ZLJl3TCsz3eVOWMqVzu/q0i+tu423bKhPMn8QZ4q9sZnpRZKZ6+gMt+SFnnDXX
	c/rHVPQX9tWKPiOnNR/7qOfnxK+yzRXFCAMxGVkobtJGbo3+OoR5wJFr09QI289T
	9mF8Eg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhjrprm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 11:50:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b18165dc53so2721898a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 03:50:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794657012; cv=none;
        d=google.com; s=arc-20260327;
        b=oLnr7iSyEFplnN74FqXulCLwRkAu272rTx7qIYbiiCfsCmxK+u7tRu2BSQmJlJqJVl
         HOAdubpVvl0eNnmhq3YHbX5JKOwE3yhK260YPT/TkvdyUaNQ28hEFBeNmAESyPRrqaTY
         VqK7jTcngdLZ2+dE+lXK81Lb2tkC4pFE59DyMVKuJYjs55I9F7ShrYQTyY4pyKPARvs4
         wyHnN9PQ3PK1Dg3xTA5TLLTy7jNZ+x4YKkJZQZV0dchQeLwHcXPRI6YryEmbzr2Tz+Gv
         z8hpO0T9E9fju/RVIzM9dLj0TGLU6CJ8MIkcsZjOCt6SErG5glIraRNrwzLr6MAttxRZ
         9GMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1/1WLzYMEGYQaXjv2m5ge60WfeRW/hTmJOCmO45FGgk=;
        fh=RwD78PO4kTjiFBl8gQ/eWz0QY7cOWWK8dMfznznVbRo=;
        b=BYhsdoMYwfgT6gfGINnU5F8cGmHCSGoBldvcFeoXA65V8UDq/u32+sX2dpdGcvbQF3
         h9tsZIiO5pZ7o7U/pG6Hd2bU+wl+O+D5Cczr9bjE0mu5e7OKeNhy7TxnCbgj2MpjZP8G
         PR4pBTfPiw6VhOuQVLmtVrwAJZE0ZyMk+TyaacR9VQjGiN3kNQuJ7Z09NCyyXMQRX+CA
         wnzk6B1AqNWm/iktnUEgAYz53R9jNJf0S6FO5ha1yHY2MrV9XyPYWBi0Ao3AMVfCTpae
         vYEdXgb8MKv7Wsww+DD5ZXFGwv/KGwwlhWaiztwPXHUhKTU0xn6vOh9fz5ZnP3Mk9RFp
         Gu5A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794657012; x=1795261812; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1/1WLzYMEGYQaXjv2m5ge60WfeRW/hTmJOCmO45FGgk=;
        b=L9GpcGKGDFkOf6gAxxFBS55T7EU8OMhj9bdbo7gbW7+x0LuEy5rSGZOzdNq0kBgAGF
         5l/ytJDUE98FK9y/1Hr7kwnqaoVmyU7kV8hooVq/0z7STFMXMR8dS1QvQd7V6S4vt2+H
         gqj8+mbmj1qhLyG+k9dlKFK+87/n0Ctv7uLvTCfXl/FufiuGm2KuTXqMpP7xfWEYTS/h
         m+Gx8Lizq1Vs8TJp79sY+5khZ78iIwEOGbHCiu1C9uFr4c/6orLC8CpyK/NuydxQ4t4j
         ZrXT8VjaB4uY/zIU+lMDrOiUEdF3JB1YpwLbrve/gGUeiHC2YRfaPyL4UhqcS136kejm
         HlDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794657012; x=1795261812;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1/1WLzYMEGYQaXjv2m5ge60WfeRW/hTmJOCmO45FGgk=;
        b=FV85oUi2UzglKcwW8+dO3FrZioJq24+un1IYbWbm/S+FECZre8vulzumZockW+eaRL
         r2dzqjnb50nZb18VKpV8ussBXxpwepKGb73AJRe3KUKBEOxEKbbVZHtESJ/AdaRUigpr
         6l1TJ9G2Geub25wk76CMIr/4fKkNbM/Smo6PCpNQFqd885IgiDd7VrkL8O6cEMeWSsSf
         FuStZAQ0eA1O6AquQtrG27f02lA5kHAdni99irBFaYlvqfydVorHzOQ1fq80icOaVCi4
         HBKyZYpYuOrCbYFVerU7kVyVQaIBWFfujd9c3XZNkkeyyZlZ0Je+WUMLbbnNfxNSNfMy
         l6Vw==
X-Forwarded-Encrypted: i=1; AL+hErGqIH8XlcTCdcurV5ZGTdV6lIgvg3b0slSKxGxzAGTSIGBx8Qcw7O4tLE2ootynYzo7ZrCITIUb6e4zO86wnxI+@lists.infradead.org
X-Gm-Message-State: APuU4Z+607whgULo6zrDs0eeIOZynVlyqXb8SZWyTES6TjgfHwYruUaf
	8V28RbTXuaCuNtrjTWqVmJg6mfaOgjUrznpS1YdvkWnNZZ+VDs/wee71ATEykW3daHO5B723WK5
	kjw8G//oHQNOmNs5/LMFFoXrU4+h0ptmKu0lO9dc6L5VBabJFyKpzB4vjSWrBY3lys75ts6hL9I
	ChCcc5ANSUpP2GFOmQwrDIynFghfbODq/DueDqe8d1GuQ4sR9gz9G7
X-Gm-Gg: AYBFou2hWoqQkD+xYydnB57O7MecZuCBun9OwA/zQO06joEE8MDVAleeOTJcvFDfU17
	uQmrlYZcm2skWbEmQBDvto3e3R+yJofn4Q/MVkYIkWgMMr1zQ4CTC4sHIerHIAcGHcBG+0uzcew
	AMeuBLAzI8N8gLrHJvQKfq344R1jfbnyf2SfqMCfPcYhADKisE8outg6gy0A==
X-Received: by 2002:a17:90b:3ec4:b0:3ab:c80:9370 with SMTP id 98e67ed59e1d1-3b1b09e5ed0mr4929467a91.20.1794657012072;
        Sat, 14 Nov 2026 03:50:12 -0800 (PST)
X-Received: by 2002:a17:90b:3ec4:b0:3ab:c80:9370 with SMTP id
 98e67ed59e1d1-3b1b09e5ed0mr4929447a91.20.1794657011622; Sat, 14 Nov 2026
 03:50:11 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105001257.1368266-1-me@ziyao.cc>
In-Reply-To: <20261105001257.1368266-1-me@ziyao.cc>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 12:50:00 +0100
X-Gm-Features: AclHuK_M9u9pSitA56QWlgF1DmcZaRUB93icyXp210YoENL1vh_SV8siUFJBQLc
Message-ID: <CAPx+jO-OzHrQ2GXfBzWLRHSgyTpyphhvRONCwohg_F3OM8YgQg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Error and deferred probe fixes to Rockchip PM domain driver
To: Yao Zi <me@ziyao.cc>
Cc: Ulf Hansson <ulfh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Sergey Shtylyov <s.shtylyov@auroraos.dev>,
        Midgy BALON <midgy971@gmail.com>,
        Finley Xiao <finley.xiao@rock-chips.com>,
        Frank Zhang <rmxpzlb@gmail.com>,
        Chris Morgan <macromorgan@hotmail.com>,
        Kevin Hilman <khilman@linaro.org>, Caesar Wang <wxt@rock-chips.com>,
        Elaine Zhang <zhangqing@rock-chips.com>, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NiBTYWx0ZWRfX5YZQtIbHwCWr
 sGPkalS3cr/gbZOuUBQCaYbNvDKbHpXmGHzLcE38Xzsilf1vmXI9C8kqdsqPCngWcBfu4V6tFnG
 rVh3lAAv1wGWJ69FbdIK9JFXFNG/S31R2eX7OYxdp2bFJh9mdWIGl1zEVlCSrvXsvTAjUbc8sXK
 1JwYs1kP+u2/VNXwueZkj6ZfNKcWVYkPQUi90I2MK2ZNikArW9jkV7FvKGO0O/QKJ0Nb3TdUBWZ
 oWovHd3iuTqPKaO6ph/HPpG2ho6/vg6JuntKlvdhShycydiFqKK09E1lgB0ouGvrYT/hu1Vmv7Y
 nsggmhYFNm7PGCdtX6LG2RUIgXADSySOaXuqYi6Etit3v+Weg+wRrROcaQImBi9IDkBfCfHulu0
 y/hp1c0WMrUgpoHlFbGRiR/EuyIxJBIizkv/wBDe9b+jPqroAauVPFl8LDIx7REP0qmZ3lJ9oFt
 YOR7akLwMrc7pIW+WBg==
X-Proofpoint-ORIG-GUID: weGyothQa9DXvzTVX4hxTy9EEOivLkYj
X-Proofpoint-GUID: weGyothQa9DXvzTVX4hxTy9EEOivLkYj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NiBTYWx0ZWRfX2VoyA7yvK1Ie
 f0AvIwXfIzud1XuolNlB5Pd7sZKA7s/poHVrt6c/d6pWLgZTn3o2pUhWMslu2NiTplW7mCWYnMF
 wfOLrimhd4bjx0JgcpzAZDpa4/xXLcg=
X-Authority-Analysis: v=2.4 cv=X9rHu2Te c=1 sm=1 tr=0 ts=6af84af4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=NEAV23lmAAAA:8 a=LTGKUmlCnc3-cF2NnXYA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_035013_277618_5E8B6A39 
X-CRM114-Status: GOOD (  15.50  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 5, 2026 at 1:13=E2=80=AFAM Yao Zi <me@ziyao.cc> wrote:
>
> These issues were found after I upgraded a RK3528 board to v7.3 kernel.
> Here's a configuration that I used to reproduce both of these two
> problems[1].
>
> Thanks for your time and review.
>
> [1]: https://gist.github.com/ziyao233/a5ee8862d1baf21ad756cf4e959e14c3
>
> Yao Zi (2):
>   pmdomain: rockchip: Only put clocks that have been successfully
>     obtained
>   pmdomain: rockchip: Don't log when of_clk_get() fails with
>     -EPROBE_DEFER
>
>  drivers/pmdomain/rockchip/pm-domains.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
>
> --
> 2.56.0
>

Patch 1 applied for fixes and patch2 for next (by dropping
fixes/stable tags), thanks!

Kind regards
Uffe

