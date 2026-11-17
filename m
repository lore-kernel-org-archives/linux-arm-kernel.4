Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BD3606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 15:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LMChc74a;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dAzwO2sp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gs0IFOEB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rvqbXhDVk4eAuTewQMcNRxrpZoO2UE6gkhrkk4bilQ0=; b=LMChc74a0/3Fy7
	IJGZLn9788yLCndLS5xyG81Jf2XrZN1P+AhfpgZtOxa8tgpdM15OJSzRDrep6yKcQnjGe9tR2ak41
	R4hS/4bdCPKpnFRfB5kOYn8U5lTM7P9C9ZK6K6qCgI/TQoGGv7tSY7vnVi8OZUbwH7Q6ApspI8fxA
	8oY5jaqrYT9Xojy/2n4yLvf5zb/+AnL4OS0N36gERrf7wula8pvbxaYeWCKVJTL8va136hc1R19R4
	dyj8Ca8C9NEyWPoEowJQscaHWPZc3utoEZK9D8sSycakGMnQC1m9mFITaRSWRVaKiNHjq+ZiNtlUv
	nd084p26B8v0/rmxcBCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLAD-00000006IuG-2xAW;
	Tue, 17 Nov 2026 15:32:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLAA-00000006Itb-2Q6A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 15:32:03 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFRdJc464563
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 15:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rvqbXhDVk4eAuTewQMcNRxrpZoO2UE6gkhrkk4bilQ0=; b=dAzwO2spMjFA52YP
	lWfm1fMR9YkERhc8Qme5ieeIMcKp8DTbFKHz3g+J/qI9d4lfz9FKE1n5G7LZFAfk
	oeMOa3vGAFr9C7IU7MBa3dnNMI/IjnjNURZByNs6v03+je/pSd9LhyQzrPn68mTh
	oRIjUzuMixpoZZ/WEHhriOKux5nPPCjxGGXHmlkCGFC7Dim4cRaPXHqcx7CZkPm/
	ox+dHFzPKc4bNVncWmkCcruNWtEGvLtJq5esi8U+Rt5ipLgEN6eZ1ZYaebrNwz5o
	JpUTEEMGES6T9LIVpjW3l7XGajRTzhPAQuNmxRpxjtugzbcYICFHS5ih+l7nBqzg
	eMHVMg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09m0c3b6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 15:32:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94960bd17b5so69185a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 07:32:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794929521; cv=none;
        d=google.com; s=arc-20260327;
        b=N0rE/6wKkejN9HYh3TaNMyqqf+nUhehf74FZKuRSMLypiu1C115sP0avld1/fnzsvr
         ZSUpRWvUyJjvoVoqwm2LdEB8c1+c5P1okGG0uSgzSMiCG2ZDYmam7S+SGzRGiEPW/ysw
         Mu0+73U3V64hYLNU9K85U61KwSGnU7JcP60DaEVTThOsFNnkK9donzyr5hws/wI5rIPO
         Fx1CilGm/ZcQdgdSxAss6QUA5TFvw5c9qk1yax/vy5itPz3Htclp3IavDZ/WKnP3yQHr
         3kKFoyWqt7AHbedy0EkBC6KLd3sHhfPUhcsP1eex8vbJ1sMK7GRZhELpCWBF0gI2X3xq
         0+pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rvqbXhDVk4eAuTewQMcNRxrpZoO2UE6gkhrkk4bilQ0=;
        fh=Pl6LXFMrQrbHkmefB6uuRGjc4KMkMaHQFwWbCwDlAY4=;
        b=bN1q3xYwXAIqbPgLNwYpJjfrBiPSv1fh0gIREczVYk2U3vrldw6yiE/FYgnjW5ohyR
         Uoqj8spP8YoIxBBEwpyeXuhLsHMt5RJZhD/FLKU4qXvTz4qWggQZK63YUuIFXz+iuKPt
         U+LnnYtPM4etAtSiukxSgLy2GOqwyuSFEX8Lr2tvUEkh/ZfWXJT2zNAvgM5n19cyKkd1
         1LjGqUPzSd6ToXTDHslNP4LX5lbWCTHNibNd5GaHMFBaw+7O4hH2XHLHA7fSHrLkVEpk
         /X0xlWjNTETI8llffz6PuvqH+gNemw1vSK4OzcNkX0tdRsOlGfQ5Qnd1ldIxamqjKqM4
         xEuQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794929521; x=1795534321; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rvqbXhDVk4eAuTewQMcNRxrpZoO2UE6gkhrkk4bilQ0=;
        b=gs0IFOEB/UPBOxjXz6EWJJOvdqn0ID8XzgDOmihQvb3g5OOdDhGnn+SrWcQslW1IE+
         26NB+uRiregRTWP7OC5Ymw12hxldAK+stKuX8ZlTTFf7OaOTxXYmytKPpwpewsorAW+E
         uMWs9+9iZzHILe6iyfBA96+UXsZZP3uXO1uTCDkY5JEkZ8KA/k1OKdiezC4th46fFow7
         WE+SNHK3Mn4IskrAFkitihIvL1Pda9hmfSNMSnnzRf0yEuBMct1Jv/R75SVGIUch0fW1
         uqvScXl7CZDoCGj4ydL9fN82a5T0So69VE4ur2cMZvy5Pvbc3VGt/VT1sP+/PncFWITb
         5bvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794929521; x=1795534321;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rvqbXhDVk4eAuTewQMcNRxrpZoO2UE6gkhrkk4bilQ0=;
        b=2mS8bEL14lxlcuTNOIxwhnR5e/VhaEJ9dNPh52vJNYzZoppHaSG8BY0VeCM/47I1Cc
         DZ4Snrms2ZWisdpd4xctbJG7G9AR9SjrstvZoziQtBviOWVvjal6iB756xflPtZ9Rx3T
         4Vq4PkOy0EcdLjodp87VneH07KEMZufSpSboZltIBweY6CAXD79kpZX4ZwJXyBguINIz
         lfEuHNwgMlf8rsKCqBn6T5q+MGpMWlMkw4mGhOSUNuv+uUc3ItWPZ2q1CgpPPvPxjzYa
         kFc53Im1V03pKsXQiaV78sw9GGo6hBpZChZ2QaZFtv/RZQwv5zBF2Zb6e7EBr6dVTH7D
         2VIQ==
X-Forwarded-Encrypted: i=1; AL+hErESTyvN4N9l2nYRpPrKfX25uPvP96ROzpg+eoAtUpmKpcs6dtoffj0tZ0B8KL+7eU0EuOo+iRwz1+Oqlug44VQH@lists.infradead.org
X-Gm-Message-State: APuU4Z+numOFNLlLlJfRux7LdifRcju5PfXvjXXsolyNMD3R3zIgvTR2
	IwTnbYJ9YYOlCwnKMQRaoMNoP1v4XdGE7EHYe6ZDjgDoWorcuh63RRM/BjoUN82AbKVpJoXBShb
	fiz+A3ZdnyqDEXMm3mSH4e8SSegxI7czWQJeNSezIg9RKpQfVuoxHoG4hWxGpAHzQqTY0M+unQh
	VwpwAidOO9QlUdwASbeyjenTzrbClY0a/AzuSW35lo50tPNbY51YUR
X-Gm-Gg: AYBFou3tmg6ED8Vx0k+nNzCqyDcfPyvUgZEXEdB0N9wDY+miIJCb6kC1AIwevEu3imk
	al+8sR1YAQdbVEx9b4zj5UEXo/PBcOqzfonqHtkQWSjBajLcErxzgPP8O629lEm/tn1lyWsE2J6
	HDav0Aoqz2w8AkBaDZiUNr+lgt1WJXnOiWwXTWFT3xBugt8lFWnuACjg8LUI9kN0koK7XiYGhRx
	boFq7r8ZzZ3jaBACJTqsOOm5k8kAG3SXkWW+ZwZUbr4Qnn6/EMzfH3uRr/EnSdTNHXcr/hGXvsb
X-Received: by 2002:a05:620a:2548:b0:949:7b51:2dc1 with SMTP id af79cd13be357-949994ae281mr2619685a.2.1794929521025;
        Tue, 17 Nov 2026 07:32:01 -0800 (PST)
X-Received: by 2002:a05:620a:2548:b0:949:7b51:2dc1 with SMTP id
 af79cd13be357-949994ae281mr2612285a.2.1794929520342; Tue, 17 Nov 2026
 07:32:00 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261117-t9xx_driver_v1-v12-0-e181b616b820@compal.com> <20261117-t9xx_driver_v1-v12-2-e181b616b820@compal.com>
In-Reply-To: <20261117-t9xx_driver_v1-v12-2-e181b616b820@compal.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 16:31:48 +0100
X-Gm-Features: AclHuK_lDMCUZMYyFfncaim5uPRYhhiPBMrtwbTDrTdo14SKGBiqnZxhh1KjEuo
Message-ID: <CAFEp6-2Ru8=dMA=ra3r+ShvxWoLAa0i-xw0e8vhQ+QxRah3f3Q@mail.gmail.com>
Subject: Re: [PATCH net-next v12 2/6] net: wwan: t9xx: Add control plane
 transaction layer framework
To: jackbb_wu@compal.com
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Wen-Zhi Huang <wen-zhi.huang@mediatek.com>,
        Shi-Wei Yeh <shi-wei.yeh@mediatek.com>,
        Minano Tseng <Minano.tseng@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Robert Yu <robert_yu@compal.com>, Jeff Chang <Jeff_Chang@compal.com>,
        Eric Dumazet <edumazet@kernel.org>, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2MSBTYWx0ZWRfX2tvh+X5uAnA4
 LN2uJ2VwWH31bZfng6tpu+l0C9P9Umb3Ya34a/jfcFDoMGccWEJAr7jcylSKW4QYVBY4csWEht8
 Fi8LCRl8TppHGXs5INJMD5tkFI5M4CQ=
X-Proofpoint-GUID: XrjWy1fTdYQbUkvhi0XMKYjsOMmKJzhi
X-Proofpoint-ORIG-GUID: XrjWy1fTdYQbUkvhi0XMKYjsOMmKJzhi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2MSBTYWx0ZWRfX/Cx33SK9SjkU
 byLxyawALQpbbLDOlREaok+UMT8X0wso0/dlOwxojCE+xnvlGs3HpbDRDbk/Yg7Zp057QmFxfub
 OMrJdsu17ah/uq8If+9n17IUP9c3sCNnUuN7dQ0/t/mmarvgUf0C/lN72aCDDAO7ZDksa1DhVRf
 r0tDd89Edu7PhAQefBbK+BtPqU5Lf+AVbrzcRc8pBmcA+wp/x4sUc4X/eI4QbWL92vuPrMof+Ge
 Kio62zJbqfv2zAs1AJ5pwsU34PsxNCgh1U2b/7E15Ed7UdHuGPNIF9nTO8bOOUsMJ2IWGeIg5bO
 ZwlIez2pgcRUia7agxQ3D4pWcGOMXzu0XUyzCK7z/G4df7INdzMmVvYIzAj4J5+r4OpGGdtQqgB
 LvAwxUaqo/3yw3MkYERq/g6VQoyUoA==
X-Authority-Analysis: v=2.4 cv=F7rC5ahN c=1 sm=1 tr=0 ts=6afc7372 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=3D83DlupAAAA:8
 a=qgzm9M8pbGeJEq2Y9kQA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=LLo2LcjZcqwTTUQ_I4Ao:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2611040001 definitions=main-2611170061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_073202_629177_9C4F392E 
X-CRM114-Status: GOOD (  31.25  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 11:51=E2=80=AFAM Jack Wu via B4 Relay
<devnull+jackbb_wu.compal.com@kernel.org> wrote:
>
> From: Jack Wu <jackbb_wu@compal.com>
>
> Introduce the control plane and transaction layer framework
> for the T9XX WWAN driver. This patch adds the core data
> structures (mtk_ctrl_blk, mtk_ctrl_trans) and initialization
> entry points that subsequent patches build upon.
>
> The control plane block (ctrl_blk) starts out with only the
> device back-pointer and an opaque pointer to the transport
> context; later patches add the port layer and FSM hooks to
> it. The actual DMA engine and TX/RX service
> implementations are added in subsequent patches, and
> mtk_ctrl_init() and mtk_ctrl_exit() get their first callers
> there, in pcie/mtk_trans_ctrl.c.
>
> Signed-off-by: Jack Wu <jackbb_wu@compal.com>
> ---
>  drivers/net/wwan/t9xx/Makefile              |  1 +
>  drivers/net/wwan/t9xx/mtk_ctrl_plane.c      | 45 +++++++++++++++++++++++=
++++++
>  drivers/net/wwan/t9xx/mtk_ctrl_plane.h      | 21 ++++++++++++++
>  drivers/net/wwan/t9xx/mtk_dev.h             |  3 ++
>  drivers/net/wwan/t9xx/pcie/mtk_pci.c        |  1 +
>  drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.h | 19 ++++++++++++
>  6 files changed, 90 insertions(+)
>
> diff --git a/drivers/net/wwan/t9xx/Makefile b/drivers/net/wwan/t9xx/Makef=
ile
> index bd6063c85c2b..0a07507f1ddf 100644
> --- a/drivers/net/wwan/t9xx/Makefile
> +++ b/drivers/net/wwan/t9xx/Makefile
> @@ -6,4 +6,5 @@ ccflags-y +=3D -I$(src)
>  obj-$(CONFIG_MTK_T9XX) +=3D mtk_t9xx.o
>
>  mtk_t9xx-y :=3D \
> +       mtk_ctrl_plane.o \
>         pcie/mtk_pci.o
> diff --git a/drivers/net/wwan/t9xx/mtk_ctrl_plane.c b/drivers/net/wwan/t9=
xx/mtk_ctrl_plane.c
> new file mode 100644
> index 000000000000..18f0573ac653
> --- /dev/null
> +++ b/drivers/net/wwan/t9xx/mtk_ctrl_plane.c
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022, MediaTek Inc.
> + */
> +
> +#include <linux/device.h>
> +
> +#include "mtk_ctrl_plane.h"
> +
> +/**
> + * mtk_ctrl_init() - Initialize the control plane block.
> + * @mdev: Pointer to the MTK modem device.
> + *
> + * Allocates and initializes the control plane block
> + * associated with @mdev.  Runs once per bind; the allocation is
> + * devres managed and is released at unbind, not by
> + * mtk_ctrl_exit().
> + *
> + * Return: 0 on success, -ENOMEM on allocation failure.
> + */
> +int mtk_ctrl_init(struct mtk_md_dev *mdev)
> +{
> +       struct mtk_ctrl_blk *ctrl_blk;
> +
> +       ctrl_blk =3D devm_kzalloc(mdev->dev, sizeof(*ctrl_blk), GFP_KERNE=
L);
> +       if (!ctrl_blk)
> +               return -ENOMEM;
> +
> +       ctrl_blk->mdev =3D mdev;
> +       mdev->ctrl_blk =3D ctrl_blk;
> +
> +       return 0;
> +}
> +
> +/**
> + * mtk_ctrl_exit() - Clean up the control plane block.
> + * @mdev: Pointer to the MTK modem device.
> + *
> + * Clears the control plane block pointer. The allocation
> + * itself is managed by devres and freed on driver detach.
> + */
> +void mtk_ctrl_exit(struct mtk_md_dev *mdev)
> +{
> +       mdev->ctrl_blk =3D NULL;
> +}
> diff --git a/drivers/net/wwan/t9xx/mtk_ctrl_plane.h b/drivers/net/wwan/t9=
xx/mtk_ctrl_plane.h
> new file mode 100644
> index 000000000000..46f1ab9f0551
> --- /dev/null
> +++ b/drivers/net/wwan/t9xx/mtk_ctrl_plane.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0-only
> + *
> + * Copyright (c) 2022, MediaTek Inc.
> + */
> +
> +#ifndef __MTK_CTRL_PLANE_H__
> +#define __MTK_CTRL_PLANE_H__
> +
> +#include <linux/skbuff.h>

Is it actually unused here?

> +
> +#include "mtk_dev.h"
> +
> +struct mtk_ctrl_blk {
> +       struct mtk_md_dev *mdev;
> +       void *ctrl_hw_priv;
> +};
> +
> +int mtk_ctrl_init(struct mtk_md_dev *mdev);
> +void mtk_ctrl_exit(struct mtk_md_dev *mdev);
> +
> +#endif /* __MTK_CTRL_PLANE_H__ */
> diff --git a/drivers/net/wwan/t9xx/mtk_dev.h b/drivers/net/wwan/t9xx/mtk_=
dev.h
> index fc25418bb957..ff3cbaa4329e 100644
> --- a/drivers/net/wwan/t9xx/mtk_dev.h
> +++ b/drivers/net/wwan/t9xx/mtk_dev.h
> @@ -28,12 +28,15 @@ enum mtk_dev_evt_d2h {
>         DEV_EVT_D2H_ASYNC_HS_NOTIFY_MD  =3D BIT(6),
>  };
>
> +struct mtk_ctrl_blk;
> +
>  /* mtk_md_dev defines the structure of MTK modem device */
>  struct mtk_md_dev {
>         struct device *dev;
>         void *hw_priv;
>         u32 hw_ver;
>         char dev_str[MTK_DEV_STR_LEN];
> +       struct mtk_ctrl_blk *ctrl_blk;
>  };
>
>  #endif /* __MTK_DEV_H__ */
> diff --git a/drivers/net/wwan/t9xx/pcie/mtk_pci.c b/drivers/net/wwan/t9xx=
/pcie/mtk_pci.c
> index cf59038f0906..3dd8efa374ff 100644
> --- a/drivers/net/wwan/t9xx/pcie/mtk_pci.c
> +++ b/drivers/net/wwan/t9xx/pcie/mtk_pci.c
> @@ -13,6 +13,7 @@
>  #include <linux/module.h>
>
>  #include "mtk_dev.h"
> +#include "mtk_trans_ctrl.h"
>  #include "mtk_pci.h"
>  #include "mtk_pci_reg.h"
>
> diff --git a/drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.h b/drivers/net/ww=
an/t9xx/pcie/mtk_trans_ctrl.h
> new file mode 100644
> index 000000000000..9b42f33bd008
> --- /dev/null
> +++ b/drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-only
> + *
> + * Copyright (c) 2022, MediaTek Inc.
> + */
> +
> +#ifndef __MTK_TRANS_CTRL_H__
> +#define __MTK_TRANS_CTRL_H__
> +
> +#include <linux/list.h>
> +#include <linux/skbuff.h>
> +#include <linux/types.h>

Same question.

> +
> +#include "mtk_dev.h"
> +
> +struct mtk_ctrl_trans {
> +       struct mtk_md_dev *mdev;
> +};
> +
> +#endif
>
> --
> 2.34.1
>
>

