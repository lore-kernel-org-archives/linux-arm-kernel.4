Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F0D606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 14:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zCkwgzj1;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=hendrik-noack@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=JOAsYfyQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hWaQYkONkEBdIsdoNCW8IYt59DBrx+8L3gmIcFUUadI=; b=zCkwgzj1x49DFU
	lsVyYfzGVGZSKb9HLjAxfkG9XBVWfDju+3ud2w8zt/7LseTu5SESi+5O3uRT8qJxfYrnpoRgYdZWc
	YuZz6JQlb6kpNUSv+ZerMhbaR3dPzD49yAuFhSU2g5+Jb0DH8l6H3Kg9kLAc88BpSotarmrNvqol0
	kMBfDiOe+NcikXm1nEMl9i5kFGchf9HNMl+ULY2QkelWpScJeGXz6vwNgWgfpjMSNsPriNXhahf1t
	B0oTARum8I8dtZ6QM9UTRaLoJ0opUddcSUOVRXvoKV/KA9mC+UOYurAbxzcz12kez86EslHqgHJo4
	4NWxUCoqGrzYbQO5mDDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJJA-00000000qaH-1blR;
	Sat, 28 Nov 2026 14:21:44 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJJ7-00000000qZa-3EDr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 14:21:43 +0000
DKIM2-Signature: i=1; m=1; t=1795875697;
 mf=PGhlbmRyaWstbm9hY2tAZ214LmRlPg==;
 rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
 d=gmx.de;
 s=s31663417:rsa-sha256:UdT8nDwjnjYb1QF9T3p0pXPNYepa
   Z6hCQOiInwVeXejcrEorH5lONc+01ShDxUwzqhDOI5kGBlzKh/AC+3Nm+HjiFMd+bX0jYCa4UqE
   PgzLMbUowME57bvgk5rcGA6Zm6uWIUP62WBqnnJQd3z/5WWvRleCzY1EEXgi5cjXwzTNQoMYCpF
   42dBOQFc0zcU9KX083UEQlfcxt0TXr+kF88mBBkcY/2k6tD52IwkHJrHkz488ROscqSqMhVV6Oj
   GDKSzXnLmfzXO+62AQhSXiGDS3NhDyxdYINwlMWhRoPvfjDF2oL5Gsc3mtg6kigIzhUVb5hkvmH
   6z0Ww/SWVgEh6A==;
Message-Instance: m=1;
 h=sha256:
   FdatRcN3VXDCooX5to5TkR8qh/7PPh/Smpqtv8xzcVk=:
   hWaQYkONkEBdIsdoNCW8IYt59DBrx+8L3gmIcFUUadI=,
  sha512:
   5Yw5mv28BWik0K0mbTjMGsWGzVb0bNsSjx9bKqSoonN+6wmHkwFdCdlB45Ou7lYUtINKvG7TyPtUwSlfU9OUHQ==:
   A8gwy0cdBXh4QBuAZGkEERWI/Tv+QMz0uz2zKa+QMoQqkl/E5o2MbMUOlNRBpmfWANTMd15GoqFBh7q/sKSIXA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795875687; x=1796480487; i=hendrik-noack@gmx.de;
	bh=hWaQYkONkEBdIsdoNCW8IYt59DBrx+8L3gmIcFUUadI=;
	h=X-UI-Sender-Class:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=JOAsYfyQ3D34UQ5wCNMHkyBQfYEVbBe58WCVxYTZjIasnhV4l5AyOs86N3gye8Dz
	 V9JkmN/FS9bXkBfqIkIKpE0GhmG8HXol6oo8EkxNt6FEIYi2NS3NDruDPNLry+pPr
	 UObfPnHWmPeao1QQeGOj/CbVYm2SAoxjLzRESjvxwFJUHStw39ep5s0MR9c0QuhaE
	 /fgsSGmv3keSHbkNL0hINMUF+oGm6PkqbahR0y+fDfgsmSQRCHCDWXfNpgp0eGyZ+
	 hG0sC3qtaL/1+AMUUCqzmIdId5iSc55GOUvu/vTyE9EJ5DzFu88gfAeBa0kzoq9Dx
	 hsU9LnDRZeqUUAV1bQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEm27-1xi1TY1Drv-006s4j; Sat, 28
 Nov 2026 15:21:27 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/4] Input: wacom_w9000 - rely on
 touchscreen_parse_properties() for resolution
From: Hendrik Noack <hendrik-noack@gmx.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, David Heidelberg <david@ixit.cz>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Val Packett <val@packett.cool>, 
 Hendrik Noack <hendrik-noack@gmx.de>, 
 Ferass El Hafidi <funderscore@postmarketos.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Jeff LaBundy <jeff@labundy.com>, 
 linux-input@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261103044708.2461481-3-dmitry.torokhov@gmail.com>
References: <20261103044708.2461481-1-dmitry.torokhov@gmail.com>
 <20261103044708.2461481-3-dmitry.torokhov@gmail.com>
Date: Sat, 28 Nov 2026 15:21:09 +0100
Message-Id: <179587566958.70358.2137093838598431241.b4-review@b4>
X-Mailer: b4 0.16.0
X-Provags-ID: V03:K1:GY2m3SrZt/f7qJDy1gUrH/FGhr7zhnmHuUqS4PydBxyklxCqj/l
 U1/AGlHW5nYstmVJgc9V71QZrDLuGsgqFCCU9L/RloYEKKoCbDjlAptNmHwvKlxsJVSsh7C
 KhKm1r2dTkK+criImDK0gaIeOQNWFVNCA/CZHKkJg8T44grMB67j0S+PBB0rNL9vdQ8TeG4
 7Bz/aHDp72bOdDwuC9fUQ==
UI-OutboundReport: notjunk:1;M01:P0:fN0qCxvNs0M=;crqwfEtjMvlXbeoXa6p8/urq4rD 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 ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_062142_100841_C6E83232 
X-CRM114-Status: UNSURE (   6.78  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> The input core's touchscreen_parse_properties() helper now parses the
> touchscreen-x-mm and touchscreen-y-mm properties and calculates axis
> resolution in units per millimeter automatically, including handling
> axis swapping.
>=20
> Rely on touchscreen_parse_properties() to configure axis resolutions and
> remove the manual property parsing and resolution assignment block in
> wacom_w9000_probe(), along with the now-unused local variable.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Hendrik Noack <hendrik-noack@gmx.de>

Thanks

=2D-=20
Hendrik Noack <hendrik-noack@gmx.de>

