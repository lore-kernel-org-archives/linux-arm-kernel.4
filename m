Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F090606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 02:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4t4vDIt0;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O3rMRWU2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JHVLOFSLCv9GVsq054d9bMCs6jEJnblXl1piTel5GUI=; b=4t4vDIt0rfdoXe
	zBoyKls62aB6rZXyDQxudCQhv4/pME8g3ZIXKpyZBkA5/v4gIvlz0RWgpOdKJz87ngTkKxDyleXEb
	vVJ8fCmQQNbYSJbiOKV6I4P88ojPR6CD94xwwBN8cYldSiYvJ7Uc/OuQ6yM1YAkmhaEm53ru1w1o5
	tUQgMAyjNlBpR9QE3IXMrmTRT1dskQJTe00pEACm4IbiXZ5SFXUs2lo5qzAoTZ3F5Q8QK+iqXhEuk
	qxKMOUpl2Ql9C/vjtLBL/YXjV0SxUJ9K1e+UmSqD4lNivi66/6QJsCWPHuDT+OvH/gLFxbeDBAESR
	0R96arW8iZJuIpIyJK7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQEj7-0000000H612-19Kq;
	Mon, 09 Nov 2026 02:03:17 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQEj4-0000000H5zB-1EVj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 02:03:15 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5c14e307f29so299909e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 18:03:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794189791; cv=none;
        d=google.com; s=arc-20260327;
        b=pVtKqMMm/Ee4VZUDQCwRVGi+Vq5AXEJvHHkuk0gN3q7hQ/5DvWQtVhRw2+0EpJcxHH
         PTGsR5wCv4Z37lra3s0uDz2tPEJfDJKCS+VR3TZkuWFaSvWDpzUOZ3PbgIKPZiGsfYn+
         LgjvG+0715Os4TeA+kf//qww4KP9ZIIDc2sz8I6x/aXMmI+Uw5I18AbndEmX757STnv6
         Sc+VXk6tb2o7c4MNW5q21ZBcKVowYoxrEcfhLfMzqJjCkr83xYUtwa7g3nh1yKBC27VC
         FYypYYaQTVlbUaaDZ/iTU/Ez5ttjea4GhjtonyBK9Thd/gsx+9Ba4PPnahtlOKNBoOn5
         dOOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JHVLOFSLCv9GVsq054d9bMCs6jEJnblXl1piTel5GUI=;
        fh=SINbeyjCmFrXdN0RnoFB+lE5MUpMXexOMoe8d2o1Ipk=;
        b=IxyOpNu61hR89NuIRXrt3yfM4qi5Coa1hoUI5sLdlXiCYFqol9sMCBDEZ/Pc0cHI/6
         vUqfPRz46G6kmGXd2yE2fIpxC5N+ryRkfU6uF6fYhHCKx2aa/4MxSCn9sUgj4SFYMEXu
         AiT1dmoy/GsdWw211tBx7/vsftlEWrE8og11zNyJOzGoAQYK2/HEkT9/ooY7bGmTlhSt
         DLJs/j0i1aV3TDej9U74jgaBQe2euDW8lvjp574M2ZpnkNMqMit5ewo0nzQbNkVX1T5t
         gooKiB0HpEczir5/v2Z32YKQidWWB5Nq46LWYx1Yq0UflgHw5Jj4IdQcYg07mfdBMQCj
         j6Kw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794189791; x=1794794591; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JHVLOFSLCv9GVsq054d9bMCs6jEJnblXl1piTel5GUI=;
        b=O3rMRWU2bMw1bBXMzLSikdQFk5OsX9MOekjQfKE5J8ueuzejc6Ht+2U0i1Uj+ftISq
         zWM6B70GIB9Cf4nTAc+aNlU53vikB8GNctPYIGn4FRQZSKYQqD0OcXAA1qgXhvTgg/nw
         79SPLRYzg54qvxUxakcnH+q2McZhKryaKJ0DYYp1rryIjQxzbbPKS+ZKcaRk7rVUffNk
         Wz8Zn3aBWziWF22ZJ/FAnXq7qL953ynwd689rKOqmqZc9EZaalZ3Gxawae2m/6XQ/e0b
         IuVc5yW2unZM/Kttbcuz7i3dwc/7rcmzxTro0MbOAe9fPP6NtlPdWDObsnQ58LWE2+rG
         fouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794189791; x=1794794591;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JHVLOFSLCv9GVsq054d9bMCs6jEJnblXl1piTel5GUI=;
        b=s4hGAGEpEsafq2RhtH/KTS8iALtvFjfn2tk67BBvGoBYEBZ+fTbZbx7hy6t+2jdX5h
         BJ6yM/Pjl78WtKQXol18G88BIMIWyHNgR8c6exIJPfuvGlo1PME3BACdJNgCuD1xz3kn
         ELQP5FeV25IGO6otB/Dwe48iJAdRAatxa5OXWSuELaIwcuAZ28zLwncOHCdCCr6lVkar
         9sZVTBBUpakqHCjA1GdeDvssEcVw9Xfzy8LpNtYc8Ac439J1+g9Aq9bK7GRFmMIU/YNH
         SX+JNjXIrdoJgIFQJVkNNp0MPqwvVgV/mXc8X0VSG2PC//0IKWDLyXHjjhX/Ma3yMS3j
         U5BQ==
X-Forwarded-Encrypted: i=1; AL+hErHsdqBSXr3dplzLPmW2ouRAnrLfVH8PQ8XqdOQInfHQ+Haplp/fPGcUfljz2AlLhRhwWOhfCQmc+OR4ZODJ6swo@lists.infradead.org
X-Gm-Message-State: APuU4Z+lybGaopVyJDwin/c/RJ3k4Q0aOUCMMHuANOvPqMqzHRrhKSR5
	jVY1x/JtSFGlNDS9jyrLo3lqLc3RHSeq8eBFyiS4Kf8pyYWnWn/UAd0++VyyZx9rIF/FUrLPrT1
	qqtyqXFV6kKjXZcfy85T20nYn8JCGxIY=
X-Gm-Gg: AYBFou0FESNWyPaWaN+7ducqI8dml2srE30L48x3tvj0uVw8/xExhvOOAoAS9dboY3c
	wZ5uJAhx+DYtUeEoqL2iGMBU16cY3AniMpVcqhJGxHL0ZzGKW3Yul5dl+f1H/FTp80UaZe562d6
	9O67iFdwGwmNqqm247eABmwCx8a7aHK1IX0a+9lY+GO7JeDJ1WPMjenojGXXJL8QrlkUSsQseWQ
	4xRFbup55kr6nHbHxb0AMi7rnakwRVXQJJJ254+f36knQUOUkhlhCox3UH7zGTVnOG58FUqiPoE
	wUrml+SEJVdK6+VkKnLMsm0at+XcFnTDU0n9bV/2qGn+FdXF5OTD1oTS1G2hrxCrlXGtZ8pTfUc
	nwZo9mRp4pAGmcNpUBdd3d3jTNstNg7cVjV/PVdaRnYr8g7Bh2mRK/D8XUGOWzwyUlX9XoiclRO
	3ixrCG267eaUYedMfdzDXD7DxSgQk=
X-Received: by 2002:a05:6512:220e:b0:5bf:bbcb:509f with SMTP id
 2adb3069b0e04-5c14c02e15emr627836e87.37.1794189790992; Sun, 08 Nov 2026
 18:03:10 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106090342.2601665-1-hongxing.zhu@oss.nxp.com>
 <CAOMZO5CQtcpb04Vp49Rg_+DHoozRpQthW3_YNAYQHqi=VOmpEg@mail.gmail.com> <GV2PR04MB120197A63428B4142714A8F148C732@GV2PR04MB12019.eurprd04.prod.outlook.com>
In-Reply-To: <GV2PR04MB120197A63428B4142714A8F148C732@GV2PR04MB12019.eurprd04.prod.outlook.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 8 Nov 2026 23:02:59 -0300
X-Gm-Features: AclHuK-L3h5gzP6mZBeJdIsXpM-rka8mrZeT_p3Ww2YWyi1VobDmgIX4-64aPE0
Message-ID: <CAOMZO5BLAnXVRMQLz2pJuJfcGgDWiQcoZ+APfYkBd4UainfJrg@mail.gmail.com>
Subject: Re: [PATCH v1] PCI: imx6: Enable L1SS support when supports_clkreq is true
To: "Hongxing Zhu (OSS)" <hongxing.zhu@oss.nxp.com>
Cc: "Frank Li (OSS)" <frank.li@oss.nxp.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, 
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>, "mani@kernel.org" <mani@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hongxing Zhu <hongxing.zhu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_180314_402626_D2C8718F 
X-CRM114-Status: UNSURE (   7.48  )
X-CRM114-Notice: Please train this message.
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

Hi Richard,

On Sun, Nov 8, 2026 at 11:00=E2=80=AFPM Hongxing Zhu (OSS)
<hongxing.zhu@oss.nxp.com> wrote:

> How about to update the commit as below?

Yes, it looks much better. Please send a v2 with this explanation.

Thanks

