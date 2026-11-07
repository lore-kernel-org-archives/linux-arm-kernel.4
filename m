Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B3C606D80C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 14:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Lcgli72B;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=ixkdVo0Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Sv9tRvnr9TF/tmGqWJfOuRnKtgkf41Z5HKKYDQ+jKyo=; b=Lcgli72B5P2VxymNDsfVxmB8za
	cpEUQIAi6ujg7ILU4MjvrZJIjReuAWJW9H1a84JPc+p7tRvSP/3Crh7f2QdaPwTW8rpsq6EIoPdx9
	JqQPLcl3peCBciD+7sVeHjHZTKg38vAyA+zEVfVNMopA3xvw/dEC5lGmQy4ZmF3DkoR1BHFR+/MSe
	sgPRUQBsT8yty8D6d1SG2wPfBZHH/W0Qp8U7bGgF7nnHFne/C7XPDnDpulHYsdHVSVL/NhaaA/DGQ
	C518Mg9nfHOOk7CkUf7Tc967xG1plJgzztflZn3tg1k/1Eongpfes5ZKTYRR/E6+y+bR+dYTy9z8R
	1G+J/vsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPhpy-0000000Es6y-0aeb;
	Sat, 07 Nov 2026 14:56:10 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPhpv-0000000Es6T-3zJO;
	Sat, 07 Nov 2026 14:56:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Sv9tRvnr9TF/tmGqWJfOuRnKtgkf41Z5HKKYDQ+jKyo=; b=ixkdVo0Zqz03Xevev6+EHeeEz1
	IVMALVClC0XEpqnA2KMMA69iQ2nCyZsMbVYFmIrRrf0fzrlBb6SV2Oh1T7Wz3yfqJB3/rALSUPsHs
	flHyyzCaPXjSYOkyRXtBp3X7Df6y2BXW6TGYxzUMPSmCji4ClqojwoGl4lkDI52LK6YODb84z3hrn
	KWzM7saE9G2/x4gDV/D0e2lDeBEyNRb3KFXqH29Iutzwowxw3ZwSaW6rQjTzyxQkbQ1woSv5qD3Gs
	Y7tmcC3/V2fYBKWfowJHPQZsWE0CIdH3XTl80RtZ/LJF2D7yKB2rmJPhgzQ4pHCOTTAz7R4a8QGMq
	lupSoPgQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: rafael@kernel.org, Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
 Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 5/6] powercap: dtpm: Rename Rockchip virtual node descriptor
Date: Sat, 07 Nov 2026 15:56:03 +0100
Message-ID: <3394748.l52yBJDM9G@phil>
In-Reply-To: <d58bc47b95fad310cb506ca01b59cbc54f0d8c75.1793666444.git.daniel.lezcano@oss.qualcomm.com>
References: <cover.1793666444.git.daniel.lezcano@oss.qualcomm.com>
 <d58bc47b95fad310cb506ca01b59cbc54f0d8c75.1793666444.git.daniel.lezcano@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_065607_990264_B9EDCF93 
X-CRM114-Status: UNSURE (   7.99  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Dienstag, 3. November 2026, 05:48:19 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Daniel Lezcano:
> The virtual DTPM node descriptor is named after the RK3399 even though
> it does not contain any SoC-specific information.
>=20
> Rename it to rockchip_virtual so it can be reused by other Rockchip SoC
> hierarchies.
>=20
> No functional change intended.
>=20
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



