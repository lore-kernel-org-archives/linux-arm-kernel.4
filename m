Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1E8606A69E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 23:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VHJWOMr+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AMvdsJFzYJevO2T5BugHtOY5r9UDNyXdokVGV9enPe8=; b=VHJWOMr+2MYTI42whAjAdum8nM
	29pM70wJCeeCrXCH7v3MABFLvvUHl42OWaEZd6uxVYsIH9XcvVAAzLY91KnQwf5vD0uZ/Go4RvmrI
	kbWJ4lPMM675DeGgX9LbRFAAuF8cpmXvmdJn1Wm2FR7wFX5MfSDMqjR+5UEDH36sZ3vXVNz+WQ/nG
	xk66cuR3BZzDlE0FSYbsypHIOMSMCQE+2GrcZr8O5OlwAyh9lNuxeFeRYiI2C2OuoUcO5zY0fBaXX
	4WcIh9OEpPWrPSft5pscoJU88GWnc+iOsZqMnf1GkVCrbBAVnwLdVfLWZV5O59D/QBkQIz7AxeH72
	KaxTKTlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUXrv-0000000GPDM-0npF;
	Fri, 20 Nov 2026 23:18:11 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUXro-0000000GPAV-0ic2;
	Fri, 20 Nov 2026 23:18:06 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUXrc-000000002XZ-17Ii;
	Fri, 20 Nov 2026 23:17:52 +0000
Date: Fri, 20 Nov 2026 23:17:42 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Alex Bee <knaerzche@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] media: rkvdec: hevc: bound the RPS reads by the
 control size
Message-ID: <awDU_2e2yIVP5VMx@makrotopia.org>
References: <cover.1794645268.git.daniel@makrotopia.org>
 <bb9c44d0f56221874b105394169e5c377ef21b42.1794645268.git.daniel@makrotopia.org>
 <6ae6d1101d3f7095d11462579a5a3313153533e6.camel@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <6ae6d1101d3f7095d11462579a5a3313153533e6.camel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_151804_785833_B0776CD3 
X-CRM114-Status: GOOD (  13.55  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Nicolas,

thanks for the review and sorry about the messy text.

On Mon, Nov 16, 2026 at 08:49:44AM -0500, Nicolas Dufresne wrote:
> Le samedi 14 novembre 2026 =E0 10:22 +0000, Daniel Golle a =E9crit=A0:
> > The RPS helpers read num_short_term_ref_pic_sets elements of the
> > EXT_SPS_ST_RPS control and num_long_term_ref_pics_sps elements of the
> > EXT_SPS_LT_RPS control, however many elements userspace passed.
> >=20
>=20
> What did you want to say?

The number of RPS entries comes from the SPS control, the entries
themselves from the EXT_SPS_ST_RPS/LT_RPS array controls. The driver
never checks that the arrays are as long as the SPS says, so it reads
past the end of what userspace passed. I will reword the message
along these lines in v2.

>=20
> > Beyond
> > the passed elements they read stale entries of the control's array,
> > and past its allocation once the SPS counts more sets than the control
>=20
> More broken text, can you work a bit on your messages, be concise, precis=
e,
> don't get into details but into the understanding of what you are achievi=
ng. The
> code is precise enough.

Got it. Reading it again now I understand your point, I may have been a
bit too excited about my findings on a Saturday morning...

