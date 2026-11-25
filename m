Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABD9606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 09:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m9h6qj1T;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ARmuGrAr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ndml1TrXg2SawRAkKV6FOXJI1kDbBSglQk4d0J+1HpM=; b=m9h6qj1Twh9FAz
	ZSjw3cxWIgR6ebBlrZFdGe2dj0YWLKjasDBXUZSu1DxbH8RA49h4nGnmsgq6iZOAQAEWO0rQa4ZKW
	koQAnEFOF/2M0SRplbTqJuVuiN7bmV3mBdqhCMGTTO2R/Ag2XBjrIyqds7awfsuRfRrYgu9xWfr9D
	XG69Ifg+8ng+jymEPPV7ZlKhSCSY6sxzbU4WAdXdpdbXIiVNYPEEO+RfPU9xneKkK1c8DSayQPMrW
	CfwnAOk4/GQNZgyCERWKUNklr5WJGVN84o93YIC5Ny3ZFuQocX5x237/K8XzdNiRa9ymkmPXdVGSD
	dE2Ow5Jr6OB4qwYx+5XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9LJ-00000009I7U-2I8T;
	Wed, 25 Nov 2026 09:31:10 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9LF-00000009I6W-3kLL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 09:31:08 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so2551444a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 01:31:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795599065; cv=none;
        d=google.com; s=arc-20260327;
        b=N2J0K2AXLDG0R6HdHhHAewf79akV+33jU7Ap3BwvDwoB0R7SW3p+O2qrPDKtVK+m/k
         CQMvZKu889Po0C69OT2Jiye1WynGVt3U+eg4o987BZLtTFyobWsEeDO95WUu/v05Ev7N
         R4+B67OO8Wo9Ljl+qcNbkdmXABXTWJN49SO7R4TYdvv7fUjHfx46/2HyvFmu9yCl7WII
         f7FOmz6qH2DsFhZ5WXUNnKu3wk6ILnzf+WheTTOTMClQXBF9h5hecIaWMOZsYdSUkT4T
         6Ryne/TtyPWaTsYmvsPdHNwzQa/pFcjBAvtpe9ejzlfXbbnyRwZwyGdzli8G+Gp4lRM4
         oqBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ndml1TrXg2SawRAkKV6FOXJI1kDbBSglQk4d0J+1HpM=;
        fh=ZESCyZ2dsZi1BSPckhJKaS8A+YfN9kpwlXnm7vYLFWw=;
        b=lqXVlev2ljVvlQ5xZeSl4B2gd7K0VuO/dR6rzPGlcs9YshnzviUzmwkWulzwEXF94V
         vFZznyPvwtR1xXnlnzk8MQ6cVyyrv7tkJ51pp1iEnHPn6tofV8LjBSsNb0JvSE2nTT7X
         V1biGE75u29UsZSBVpveWtYLHyzA4hUNA7fZ57rnQhqkaEo07NeXS0zNlFaaqj+raWuS
         1vA/ePONDtHrf1K8Qh515xTuJhYXXfOVU2swarPVRxUUoLb/9VY72ZPY9WtYK/OIi/P9
         EZ8x1RBjWJp29wJd0Luhq80J2kTu8jC34oSa7lllI6HTp4KAjXI+/5qAGvPqFK+wSdex
         oqYw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795599065; x=1796203865; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ndml1TrXg2SawRAkKV6FOXJI1kDbBSglQk4d0J+1HpM=;
        b=ARmuGrArN4Hkx49K3GEpiN0O9LMyLfwVq0wPtiRJ98X6YgFFJHTupw7mAEx/TsRDa4
         qoRNeapPOx/qQsjkWSX2XXuNEXkrgxAiGsvjhXOkMrBY5QypYHnrk2QyFtM1Vvgo7+Bm
         BYl8XApPKjVHaU8PEryvvzIwb1bi3/8RWKZuBVu+31Ue4iB+yVB2oTj+kBRp2QgbLUTZ
         EHW1Fbb5MgJYFjRTVRbSDveSPMnNmCfCa7frDP7GqacJc9aEXdtHCO5YFuoizWmNXr3+
         kmzFWwvkJWSjwRPJ2KPIfJykuWeLcRm47tL7DxlI4e5C4yajsnZTN94/SU/0fsNKjMV9
         +a/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795599065; x=1796203865;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ndml1TrXg2SawRAkKV6FOXJI1kDbBSglQk4d0J+1HpM=;
        b=ssVVNKB6slUPcZHO1k36xmU+zV9/wxccer2zRMJXiNIJqSMNVy1IRsFFIF6BhoxFIk
         uJRIFORmJw5CypO+IzR8GJ6GNySqKX33p0tyNVeB49DBGxJMH5W8ZJInbyQSQdFAX8Z5
         9xKzHEOIcP5ziTVWgPkLVSy802qXgPvfXL1sJuZo8bz0+H3lThbJKLpTNnMSgY37TqaJ
         uGmeBCml10FBwUWJnmDEdNSmago9g7YuWOdxxcTpNDOqLqPbm8vfLZKeLA+G3/JR4IyH
         9llolGDmup2QhTBSB7yLq/mQJoXyhX9WESpyTW27fjXNxPd0IVtDL/s5wvYbsRZRgPls
         Yrxg==
X-Forwarded-Encrypted: i=1; AL+hErH1aKAEuMlqjGV1USAgSEIwHRzGmlz+N0Vm3iM6aOCquNtllIqZrMvhjmSS7DMKnCrxsHptmqGsE4JNnRKQDvfS@lists.infradead.org
X-Gm-Message-State: APuU4Z++xpz8FSPFoJvT3FQAOPQp+IOEBymj3zs1+Af13DpS6G1Jlbe6
	uAiBdMEEw/DJU1bzKqVo2MWuoEdtXmxNG7kmyZ40wK86YjaQ4ABc0t8GHTMP+LTMTmatWNpZz/F
	ogx6bVnRMBcAP+yha172OsWpKuJPiEqU=
X-Gm-Gg: AZFdTZe4JjCoKbHlx3WzU8B5bOGhT65EC42nAp+A2m305Z5XYLuYAfOMHPvDxenjgkC
	GaAEuxJeVO5kSvn6p2VzPj3O1ruN9h240XwHZvEHQEFl086z512K/zqkrQKypx8tO2qEIC+sV/N
	ulUjBcAWya3qieAmIQ4DT66g+fP5d+qFwFhVYdAkhhkoShODQEMHEGT0OUxtXTDe/geSPG2WAdn
	ekRoRqeWfT7feXFd2X+xTLMOh/54YyqMRZe0mD7frf2lo3J3s/sA/7xRncoQflVPxF8iTyOysFw
	lYp+YflVYRquD+MeRXG5H3/cCwoLs2Uut40K0BgU4e/aGSFLiLAnD4wTFsRzF321U2ysNBL0ykB
	0TbFqSxYafVnW5h7/G/8Vcl+O9oGx1UkD2n9s
X-Received: by 2002:a17:90b:4a48:b0:3ab:2d17:51c5 with SMTP id
 98e67ed59e1d1-3b41c7b60b5mr15460985a91.6.1795599064574; Wed, 25 Nov 2026
 01:31:04 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261125073857.1402045-1-shengjiu.wang@oss.nxp.com> <bdca545f7b754d757cab225952d7f79ec5dd6519.camel@pengutronix.de>
In-Reply-To: <bdca545f7b754d757cab225952d7f79ec5dd6519.camel@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 25 Nov 2026 17:30:52 +0800
X-Gm-Features: Aa3M54p5bORiV9mV6RZmN9_zoMbjiqg8A4INJOiWefrA-5NYyURqcEaFKCpWRUE
Message-ID: <CAA+D8ANRJT6Q+-sB0KCN-CEsPRQ2pX-9CVWoTNX33aSKjvAwVw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SOF: imx8: Switch imx8ulp DSP control to reset framework
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: shengjiu.wang@oss.nxp.com, Liam Girdwood <lgirdwood@gmail.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, sound-open-firmware@alsa-project.org, 
	linux-sound@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_013105_933903_47401C48 
X-CRM114-Status: GOOD (  13.45  )
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

On Wed, Nov 25, 2026 at 4:26=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:
>
> On Mi, 2026-11-25 at 15:38 +0800, shengjiu.wang@oss.nxp.com wrote:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > Replace syscon regmap-based DSP reset control with the kernel reset
> > controller framework for i.MX8ULP. The syscon approach requires direct
> > register access and creates tight coupling to the system controller,
> > while the reset framework provides a cleaner abstraction and proper
> > reset sequencing.
>
> What do you mean by the reset framework providing reset sequencing in
> this context?

It is to use the reset_control_deassert() and reset_control_assert()
these functions.
'reset sequencing' is not accurate here, this commit doesn't touch the
requencing
Should remove these words.


Best regards
Shengjiu Wang

