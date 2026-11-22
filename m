Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46C6606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 13:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rx3ToqIL;
	dkim=pass (2048-bit key, unprotected) header.d=cknow-tech.com header.i=@cknow-tech.com header.a=rsa-sha256 header.s=key1 header.b=iSm9aTxl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HMMC0LB5IhYegJWToan1YqcEUtKAc3112EBRFHGcsc8=; b=Rx3ToqILojwj6K
	SdAuCDSpuQLe3hhHuQnlCUKMzheNNME1GNa4Jo4eDKvrTrYJ9ar29KOb1NJPyGBPwBoQrozuVd/5U
	2kQKJphiFa88ifOrB8+AIV37N7fGEw/XC7rQR/Q1SvVDWeX7KCBjSwchwByd7+wV8Z9LRH8Rov9ql
	m9SLX1PurCnK8M+aI5SqZs59cfEDsvjJ2Y4PaPoQ3dv331YPDpuDvpvo1GRj58we1c03YnSfDwmEm
	K34l/b2nnmw+Bo2zKii7GWoNyl5BDScKyGDbH4WUrrbPQDqIpDUQFgczwHiRHecfWzLfOZBG33P/x
	bJ9DHeN+8YqPODeiItEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV7i5-000000018g4-0OiU;
	Sun, 22 Nov 2026 13:34:25 +0000
Received: from out-21.mta1.migadu.com ([2001:41d0:203:375::15] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV7i0-000000018db-2nRe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 13:34:23 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=hFEdDqcg2ZlHkL5dY5J1x4B25r/X63b0yKh+YIcEB7A=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795354455; v=1; x=1795959255;
 b=iSm9aTxlojd7gH6vCtxe07dnRiQ2k0/riJfTk0dyBL0nRePBhltho0gswIdAIBC9PAYaAnKk
 iMVSm/B+cNJUcykF/HlPMbvoY9y58QrnWmM3b2rQxEjg1XMWElpSsde4pnXcEIl8cvUDnn4EAkb
 pQx+xyVn9s3oAPjciEepro4Ylz2vx1H5wLEagRctSgSEHv915N9rZusFhvc34Ituaz/XVQVUGtF
 5hp7xfA65rUaIRqPf4edfJhQMcxbpsmozLsoF9P6Zy/Mmey6wvoNAa/BYaRv+Tmi63X78O0FlSM
 MGdAuE5KK8QHa5OiZ7DDqcQGNtD8Z/myWHRaoJNWnHwBQ==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 5d2907f0ba893942;
	Sun, 22 Nov 2026 13:34:14 +0000
X-Mizu-Trace-ID: 5d2907f0ba893942
X-Migadu-Flow: FLOW_OUT
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Nov 2026 14:34:12 +0100
Message-Id: <DN1S1D7FIF6B.2WHLNV11LRJ6B@cknow-tech.com>
To: "Diederik de Haas" <diederik@cknow-tech.com>, "Daniel Golle"
 <daniel@makrotopia.org>, "Detlev Casanova" <detlev.casanova@collabora.com>,
 "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Heiko Stuebner" <heiko@sntech.de>, "Shawn Lin" <shawn.lin@rock-chips.com>,
 "Michael Riesch" <michael.riesch@collabora.com>, "David Heidelberg"
 <david@ixit.cz>, "Christian Hewitt" <christianshewitt@gmail.com>, "Marc
 Zyngier" <maz@kernel.org>, <linux-media@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Cc: "Nicolas Dufresne" <nicolas.dufresne@collabora.com>, "Hans Verkuil"
 <hverkuil+cisco@kernel.org>, "Jonas Karlman" <jonas@kwiboo.se>, "Dang
 Huynh" <dang.huynh@mainlining.org>, "Piotr Oniszczuk"
 <piotr.oniszczuk@gmail.com>
Subject: Re: [PATCH v5 0/5] media: rockchip: rkvdec: add support for the
 VDPU346 variant
From: "Diederik de Haas" <diederik@cknow-tech.com>
X-Mailer: aerc 0.22.0-31-g5c1c510d2b65
References: <cover.1795191822.git.daniel@makrotopia.org>
 <DN0BCGELZCSC.G0MWCPQU85UO@cknow-tech.com>
In-Reply-To: <DN0BCGELZCSC.G0MWCPQU85UO@cknow-tech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_053421_375222_64F6D157 
X-CRM114-Status: UNSURE (   9.97  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri Nov 20, 2026 at 9:16 PM CET, Diederik de Haas wrote:
> On Fri Nov 20, 2026 at 6:36 PM CET, Daniel Golle wrote:
>> This series adds the VDPU346 decoder of the RK3566 and RK3568 to the
>> rkvdec driver, for H.264 and HEVC. It continues Christian Hewitt's v3
>> ...
>> Known limits, none of them introduced here:
>>
>> - FFmpeg's v4l2-request hwaccel does not set the HEVC EXT_SPS_ST_RPS
>>   and EXT_SPS_LT_RPS controls, so HEVC through FFmpeg decodes wrongly
>>   on this decoder as on the VDPU381 ("Long and short term RPS not
>>   set"). The handling of these controls is also the subject of [6].
>
> FWIW and IIUC, Detlev has a patch for that here:
> https://gitlab.collabora.com/detlev/ffmpeg/-/commits/v4l2-request-ext-sps=
-rps-n8.1

FWIW, I submitted and made a minor update to that patch here:
https://github.com/LibreELEC/LibreELEC.tv/pull/11686

which updates the comment that kernel 7.1+ is needed for those controls=20
and added the EXT_SPS_ST_RPS and EXT_SPS_LT_RPS split with 64 and 32.

