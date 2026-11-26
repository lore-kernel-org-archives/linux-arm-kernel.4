Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB471606A336
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 08:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xjc2DwQe;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=R0yjQFSy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mDPiQneaNeUi2efSk5eylep7jPHdMpeW1fG4LwrvlbE=; b=Xjc2DwQeA+9fk1
	EzushAJSgj1NV1uKc80P0mZt1PmqhlFkImRka2HGBJxUirb8Fm60B23AxFX6C14yEkW6mYgyMWM2R
	IVygkm0LraF5Id6Qy1SkBOnXZp3yhyJJlWZmMM3EieMspeOMJuqRgqUt3igd3Q6K4zMOACrROPqDV
	HzgMh2gn+JuOxDWJJLLqllXIYgL5dNo4wqJhu7piYuRiIJUQdXKgICkRlrSumhY+OP83Z25PjR5M9
	TfvzcWgMLbMC+C4uqGKuj+Fz3Aulbruao7vtaXgmgn1WNRVMTZ4/p9wOPJTvcPtslkzdvJYpQoK2r
	X7Udpg3dchoyx36Mdwyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUlQ-0000000CNQc-1YHv;
	Thu, 26 Nov 2026 08:23:32 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUlM-0000000CNPj-1P1y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 08:23:29 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-cde7e8abf9cso2468361a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 00:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795681407; x=1796286207; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mDPiQneaNeUi2efSk5eylep7jPHdMpeW1fG4LwrvlbE=;
        b=R0yjQFSyIkT7lqMqW+CdBV979oDoLWtnRj1on+b9Vqt+X9DvYuvHfFhEvGYljOnmfj
         fxU6E8U5IoXBsjMjss+9yTq5xlCtP40ZdQAYheHHuYSjE+I5hOYYnmdAd+UJBaZTCE2X
         kQsCuGMDjJpLin46wfRqWduEvOKhA5za7k6Pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795681407; x=1796286207;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mDPiQneaNeUi2efSk5eylep7jPHdMpeW1fG4LwrvlbE=;
        b=2CY2/tB1tZlVAIXLqoQ9OUozE34QJoidaQFqL+qT55Sgwybd5tI6tqjSsDgPMEnMiF
         nF1YfW1WRq8DaGSgAzDVpyYXw0PxxL0fV1pd0rmqMWBFCaDNqJt2taB0pPRuKenJbQlZ
         8I2neAhmrPqdMUhtqvft4Zl+EsuJTPKuPugEQND0MVSmTBMYIvqwe2PDOmDiTySovpWJ
         0Q8VavqIJu2DG2TaK89TlevOzwf1+24L0xechocuXVntSoazNQzz7bqAd1rQMln2gSaT
         Q2ytprgWJhGexrAej3I4nvufeqv1j/l33XmY3vZ59DGWrl5obrGyjwbSuJM0qyg2zvY7
         Vvjg==
X-Forwarded-Encrypted: i=1; AL+hErFPeq/uVjCg32N5pcvZ8HWVMP+TXX2ZGDP/qn0/0KLQEXw3UwuMgmn28nRnCO7G0dLEHLZLgsdhjTsCIlxO7EMJ@lists.infradead.org
X-Gm-Message-State: APuU4Z/2jHBIPcQteZbriqlrABqvjt7LeQF4poLbdmTcF7Pb+LAodhr5
	UHhNlXpe8X6+csAXYTHksSuOTUM1wjE1cKbfEKTAq2xH/rXqA6hE/Sxb/KrwmOUkLkaOepED1S2
	ITrk1UQ==
X-Gm-Gg: AZFdTZf7sOPmnKvqb4vApcoa5ym8kaVN+JPgi9kvf1/iv3fLg7OrULMtWIoLlzKswIJ
	P7MzSsBBtfVzXwtos3X3C4/d4N68YeZC06Dlu0pV8YskYdkoHWEABXl06eL8KnGiHY1Eu4cAGJ6
	mSWBEGCyUSg9rn8h51DL0etD7FFZE+NxZN40t9TP0M48O1zPMrR3TLsojAlDdb3XlyZhtqlOikn
	r3AZWhWKmlIVtAb29IGK40/r47XOD1nSUdzeQ5O5ye7lqvTCs7UwLAattHdunfkpvjVApRpOwRN
	IzjHKAsDDPfwGF+HvJpuzKCVhCyfrUDytfS4XttBIaTqu4UOelCBNpx1cnEfi4WPDb56iBbiIZm
	IYsSKcavkTJyidN5W2KJp4d1VqCWgbSDYTFeidiLsA6wisSIx87OGwGiWvVmh1sTht9c8O8ni7P
	jSazS56wZwKEDbwfRLLyR3xf99LEfMZxxfostNgqL3PjV6PJbp4s1MUmFwMc+o0EIYvHUpWaZOE
	wsGl5SfOmryu3L97I1jKykENzSf+H/g8GOu7cLYbpG+4Om9OvBWBzNoHBeAbMDjaQ8wXVEiZaHp
	YoO6RrlNTmnpez3vJ9gO2VyoRLYvxQUEOnb8P1AtPAlGG/4MSvlcHWWolRC+1kkecbQ=
X-Received: by 2002:a17:90b:3b47:b0:3b1:83d4:5d33 with SMTP id 98e67ed59e1d1-3b41c99524bmr19723033a91.60.1795681407268;
        Thu, 26 Nov 2026 00:23:27 -0800 (PST)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com. [74.125.82.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d639fdsm34744924a91.10.2026.11.26.00.23.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:23:26 -0800 (PST)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-386b8f2f671so3664547eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 00:23:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGhzhSeDFzSQWMCsMvZ0njzLGvhE81MRAVBveTyG2RRQIeDv3SZYo7pa5ZVjgdLUjRsB9TylvN26pkXyLebmbXX@lists.infradead.org
X-Received: by 2002:a05:7300:a986:b0:386:c6e4:5732 with SMTP id
 5a478bee46e88-386c6e458eamr8946070eec.3.1795681404503; Thu, 26 Nov 2026
 00:23:24 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-22-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-22-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 16:22:46 +0800
X-Gmail-Original-Message-ID: <CAC=S1njgbFAsOruyi3tPecJTNnSM9xkeLqM6buvrvSTJXv1c-g@mail.gmail.com>
X-Gm-Features: Aa3M54rE91WEZuEtmgUF0iLv3_PtSqqif-lCGzmC6rPCZG5AI3LqYIpHVgEKyRo
Message-ID: <CAC=S1njgbFAsOruyi3tPecJTNnSM9xkeLqM6buvrvSTJXv1c-g@mail.gmail.com>
Subject: Re: [PATCH v2 21/46] soc: mediatek: mtk-mutex: Add new functions to
 add/remove triggers
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_002328_382427_53D81275 
X-CRM114-Status: GOOD (  22.36  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Jul 14, 2026 at 7:45=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add new mtk_mutex_add_trigger() and mtk_mutex_remove_trigger() to
> replace, in the near future, their older style equivalents such as
> mtk_mutex_add_comp() and mtk_mutex_remove_comp() for the Display
> Controller related MuteX triggers.
>
> The same functions will be used to also replace the Media Data
> Path 3 (MDP3) specific mtk_mutex_write_mod(), unifying the MuteX
> handling across all of the currently supported multimedia-related
> drivers for MediaTek SoCs.
>
> While at it, this also takes into account the upcoming refactoring
> of mtk_mmsys and mediatek-drm, which are about to migrate to a new
> Component "Type -> Hardware ID" mapping, by adding a new function
> parameter "hw_inst_id" to support that.
>
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora=
.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/soc/mediatek/mtk-mutex.c       | 60 ++++++++++++++++++++++++++
>  include/linux/soc/mediatek/mtk-mutex.h |  6 +++
>  2 files changed, 66 insertions(+)
>
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-=
mutex.c
> index eb5d381ff5af..ef8e77f7e2f6 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -887,6 +887,65 @@ void mtk_mutex_unprepare(struct mtk_mutex *mutex)
>  }
>  EXPORT_SYMBOL_GPL(mtk_mutex_unprepare);
>
> +static enum mtk_mutex_sof_id mtk_mutex_get_sof_trig(enum mtk_ddp_comp_ty=
pe type,
> +                                                   unsigned int hw_inst_=
id)
> +{
> +       switch (type) {
> +       case MTK_DISP_DSI:
> +               return MUTEX_SOF_DSI0 + hw_inst_id;

Unfortunately, DPI / DSI IDs are not continuous in enum
mtk_mutex_sof_id. There are MUTEX_SOF_DPI0 and MUTEX_SOF_DPI1 between
MUTEX_SOF_DSI1 and MUTEX_SOF_DSI2, so this may point to an unrelated
SOF ID, Also, an out-of-range hw_inst_id (if ever possible) can also
map to a wrong SOF ID.
You might need to explicitly enumerate and map each valid (type,
hw_inst_id) pair and return DDP_MUTEX_SOF_MAX otherwise. I don't know
if there are easier way to work around this as reordering
mtk_mutex_sof_id breaks older SoCs.

Regards,
Fei

> +       case MTK_DISP_DPI:
> +               return MUTEX_SOF_DPI0 + hw_inst_id;
> +       case MTK_DISP_DP_INTF:
> +               return MUTEX_SOF_DP_INTF0 + hw_inst_id;
> +       default:
> +               break;
> +       }
> +
> +       return DDP_MUTEX_SOF_MAX;
> +}

