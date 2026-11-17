Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86759606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 22:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GBbfKHzS;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nbPCRoQE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4s3mRwUX6ILMJnNwIdnhxtjyTyFSrX3O/LnhuPICPo8=; b=GBbfKHzS+Zr+vH
	DFsgousgLoxKD44eyQc9bsX7a5IPCbYikith+uTNce3f/s5ltXV/tLWG32O2GpsEAD4kgdJB8icif
	P20BpdQ145cyRXGHj678D6rnRq4148cBkJ+1FcrGbx5jS4DkFE5sF8aJnWcG9l6cumLWyTyx5zz1n
	BDiEv2rNZukX7oMtzVdoKCv3DfZ+YXvfh+zVsBZ3OJHcYX2m39IDMGRKROfwEYTTy4ORI7NyiJLfz
	ztOYaO/WqkWCoB2lk+fNOcWy5FRFhUkSR2Cfc3W3Ke3FTxsIgK66CV15dJQ3Bw98ozgsdTKZ6OICS
	qO58m4MtvHDWokgiffuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRda-00000007Dy0-2Nn8;
	Tue, 17 Nov 2026 22:26:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRdY-00000007DxU-3FLN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 22:26:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7152640B91;
	Tue, 17 Nov 2026 22:26:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC151F000C4;
	Tue, 17 Nov 2026 22:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794954408;
	bh=4s3mRwUX6ILMJnNwIdnhxtjyTyFSrX3O/LnhuPICPo8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=nbPCRoQE3o89KlLREqLTWYyUtsNPEovbGEBCvg9Bs5W+CQn+EDoSd4kW6CqQ6noPn
	 fij8XDQ78Aiz1EQNF/Hnm/KK6k1ivKx51Rs40LhTRyKdis/NA0QALWgxa1jEn7XRrO
	 WqI2TGo5r17KymhUe132c+/rkmGIwK7In96jrBpnei3XIdW2MCH3wwmhw63UR7WLv2
	 yVsOlDs+YPNQvWkY+UMnWYyMYjKrrDoAr11HslTU11tjeKxn6U3EieqogoqSJvWMXD
	 N84lCTVVRl/84g9ywTc6nzbFoO5ebOnayr+Ug7EKMg8ituJcg7A6tTW+g5Zi7FTqZK
	 GrJXO1eClwF3Q==
Message-ID: <44bb9bd5-42f5-46d2-8dca-dd220aa221cb@kernel.org>
Date: Tue, 17 Nov 2026 23:26:38 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/6] soc: fsl: guts: add the RCW override of the pad
 muxes
To: Vladimir Oltean <vladimir.oltean@nxp.com>, vjardin@free.fr
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, Ioana Ciornei <ioana.ciornei@nxp.com>
References: <20261117-for-upstream-lx2160a-rcw-pinmux-v1-v7-0-5d7201970629@free.fr>
 <20261117-for-upstream-lx2160a-rcw-pinmux-v1-v7-0-5d7201970629@free.fr>
 <20261117-for-upstream-lx2160a-rcw-pinmux-v1-v7-3-5d7201970629@free.fr>
 <20261117-for-upstream-lx2160a-rcw-pinmux-v1-v7-3-5d7201970629@free.fr>
 <avzCrmvlOQh0RVjT@lxl00025.wbi.nxp.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <avzCrmvlOQh0RVjT@lxl00025.wbi.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



Le 17/11/2026 à 22:10, Vladimir Oltean a écrit :
> On Tue, Nov 17, 2026 at 03:53:13PM +0100, Vincent Jardin via B4 Relay wrote:
>> From: Vincent Jardin <vjardin@free.fr>
>>
>> fsl_guts_rcw_rmw() only serves the SerDes lane modes. Export it for
>> the pad-mux fields of the RCW, and for them only:
>>   - fsl_guts_pmux_read() reads the pad-mux fields of a status register
>>   - fsl_guts_pmux_override() changes pad-mux fields of one under
>>     rcwcr_lock and waits for the status register to follow
>>   - fsl_guts_pmux_override_supported() tells whether the SoC has pad-mux
>>     fields and whether the DCSR view of DCFG, which holds the override
>>     registers, is mapped
>>
>> Each SoC lists in its fsl_soc_data the fields that can be overridden,
>> per RCWSR: a register or a field outside of this list is refused, so
>> the SerDes protocols stay with fsl_guts_lane_set_mode(). The LX2160A
>> lists the pad muxes of RCWSR12 to RCWSR14 and of RCWSR27.
>>
>> Suggested-by: Vladimir Oltean <vladimir.oltean@nxp.com>
>> Acked-by: Frank Li <Frank.li@nxp.com>
>> Signed-off-by: Vincent Jardin <vjardin@free.fr>
>> ---
> 
> Looks good, thanks.
> 
> Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Acked-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>



