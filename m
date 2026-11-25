Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34963606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 16:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NoZWkDyY;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=cPCMksKv;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=kBENo9fT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AfyYq8Sc71T5UfA3wqevtB8qvcNbp4sX1qIG99IDfJ0=; b=NoZWkDyYwz9kBT
	kOzDprZtDKID60cLYe1YvIREA/Hw5L20XzpC7oj/orzaVLoIBS2zfUud0QeQCkXXei6GM51O9uZ1b
	wU4ILw+tyddOFxHMlg+9ZxPnDR6JRX2tke/rIveIqZSWPqflmboCAITS415lGMEA5raYp9AlfSnVu
	/rE0wpoOsOjtAgiEqVf0jAdbiMhPLPnFwkdvo98f7F4g1zPV3759PhJJfjXYudfp1rGgU3drZuQ/T
	pGmXrm8+RPPWqIYzZGrJvCJGzptaHPAL9HHZp0FlJnpO6LfOT7mPE2LP70YMlVx+AXXf+5ufzIldE
	TFsjZouxMVpOKTGlUvLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFj8-0000000AWx9-0Mak;
	Wed, 25 Nov 2026 16:20:10 +0000
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFj4-0000000AWwR-0ONU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 16:20:08 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id A97F31D00662
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 11:20:04 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 25 Nov 2026 11:20:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1795623594;
	 x=1795709994; bh=AfyYq8Sc71T5UfA3wqevtB8qvcNbp4sX1qIG99IDfJ0=; b=
	cPCMksKvitXF5k/MnhitB3PiTetH+UnqISvh0AWcjDf5DZYNAidkGEeps676liHf
	0rgitxvsNSiYvdRymkJeOQFBVJzRzWhJThej/OYOcOLxrCwBiiSz1KqbsyQO8TsX
	NwDQT+Iw7bDQnegoaREG3bT/fgCHuM1KWCadKWqybOquY9mtGWPzt3t9WlbaD/7L
	HTvZjKonL3wkyvUMdN0tdrO/XYqLWbdv6ryekR+NB8hKA0xzuCDQ4MNJpWa7Fw8y
	otq8WDQGNHIV63h23gGLPPW90xe7wbJl2ffwAj43pDdool71FVkgtKIp6669NApj
	SbfAnY0TIcNrBGFGkCa4+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795623594; x=
	1795709994; bh=AfyYq8Sc71T5UfA3wqevtB8qvcNbp4sX1qIG99IDfJ0=; b=k
	BENo9fTvTdN4GP0UCnNBWaQtL0OEky1xui7RumZVJUB5o3mA6iDLjc9nptOPA/0O
	nX16S1cPdWaFQDYrl1YqMjh0QwOTd9HHM2IKbaVXPEdJjIRFYb6SUhAe8gVJMhY9
	KzxGF75Tx6Y9CwFA7Wx7uyEsfXiSIjtFEd+GCgvhWJbjVTX4zTUGVYGHNgrSKgt6
	vynocn8U4UdUet1LadZ+nhm+PtnX15Cvj54Zi7Z9xHDPTx6qEBX4f0wg1MMwh54x
	PrIzKtDappD3gaBsX0RTobOfhYTs3UF4n9lXcebgy6xH60etEx9HXkZA74Q2OcJI
	FbFVp9WFwgCzV1p/TuSsQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795623594; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm3:rsa-sha256:AX3t5TzBBeak2vg/A6N+HH/3pih4Zd8XrrLv48VrDGicbh7
	D7vQ7BXxaZsep/eVPwmKJXDItbquyxCgJ9/hETYbX5b+xviPbLq+3WL3k2bp+TOS
	tR3eLq9BgveCVU8+nFz4RaHbdSkfu5TgZ0MyvQsp3Efs8yWaQF7HR9VjBdMQOz60
	3+NixPZJmB0PO4tIi1nhOaSmD1fwpxEARBMH94YCkkK9BwLgWjWeabVhTWPV1S/N
	56ln3rDi3iv3MZfrmU6orIWSFuxw4JM1T3b2DZ9Bwg+atbjx3FAv5gcSHB31B41s
	kMa3cjrG/rlDG7xi80jA6rxjLY8LSbFvgqRdQWw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:ewpOKjq+8xGo9l037fyrK0EmJb5ZitjmnDWcADXRpMM=:27BnO1EXN0YMCE2fFISwh+FxvqqcbJwqETKkshbRBKw=;
X-ME-Sender: <xms:owoHa2HZr8KE3MFuiM60BGQFN9bxNbQYhXJ92ObHxZ-cP30Hkr5X_w>
    <xme:owoHayKIJ0GabU-J361cDSzsNxe7OFjY70TV75eq-eZ3puQf43xxi-mO5ys6tGHbM
    UayMb0N4HDJl4fQwxniDSCxmYEbkv3zR7Ko8n7sakdqGWR_DWcWAQ9z>
X-ME-Proxy-Cause: dmFkZTEHZ2gOUHKdZOwxkqzCwEBL9SXUd7vMl8dFRVB4Aql6skIwGXAVie/0sg9mu0LbF9
    u0sDwrGtoiWlcPTBPiSPHqmbTItUffYybStq5QdgEzynMNyFwXB4Zja3pQpVa69V6KlbX8
    2t+Ezf6kj+lZ1OOXcfi2c1DFH4i1uCxiYeLRef4vxR6jfbPfmC+EXsYIdODxPZc9KPFHOV
    +3HF9vwjPuUDEhsQh/knRh8mQiaZfn4lV9SsZLGL4Ft/Gyid42tizFOPBhFTnsgUslVD34
    q/xdS0Bmv9aLoqjXdwbweXIcVFX99wJDCeR92VlbM7jU6xVYcMtqqyALbDS2t9GVedOujV
    lEPH1P29r0vBd1NU1MFjLw2bDcz7r4Lux8qxtqpiWpV4b54EDCaggD3tvrl7l+RiKsFoc0
    T2CzzwSK+73Z2yp6WI4MoP8YGoL24l6wrWup/NcsIDZPwp22W5h62yCG7ozKZ5lRd7f9+L
    5DV7B6t56wQxlxneYE2RqoKssASIn+nUMLK59paFgrO84TZjaYC5xA/D/ltHhxaXNkdphJ
    PpG8XFMrjceVymOyNPZlGa7AUd6ICV8a0YYHamvTRabjiOkia7X8LhlEr/ed4vWpWxTCog
    cgt/0WC/CBxbjP8rzZb+vAKHD9Zd61A+7/37q2TpfdsHXJAzuKS1EASMPvnQ
X-ME-Proxy: <xmx:pgoHaxlBUWBnNfMZy5P1NEXUrNWzBy3QniLB71HSzhgAD9r_14mesg>
    <xmx:pgoHax8igM61ewYM7j8R7o32S-DOcVgeUDjylqzHs_QoWKU94Sk4UQ>
    <xmx:pgoHa6k4nN6s6uhgxuhbZrv_FbsdDdSiIl5amL_8N88oWJG1IRPPNg>
    <xmx:pgoHa3k-hCBjUFFd2NBp0gaFhn7o0azmufXMaX29RXHGB0oUrX9gMQ>
    <xmx:qgoHa3X5NyXSmwuxSibPfNNmm1PI8Or9ieupslyQTT4kT1pDs2-K1-df>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 6965C32A0099; Wed, 25 Nov 2026 11:19:47 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: AB0r1c-Y2KSN
Date: Wed, 25 Nov 2026 17:19:27 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Siddharth Chintamaneni" <sidchintamaneni@gmail.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Fuad Tabba" <fuad.tabba@linux.dev>, "Marc Zyngier" <maz@kernel.org>,
 "Oliver Upton" <oupton@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Suzuki K Poulose" <suzuki.poulose@arm.com>,
 "Joey Gouly" <joey.gouly@arm.com>, "Zenghui Yu" <yuzenghui@huawei.com>,
 "Steffen Eiden" <seiden@linux.ibm.com>,
 "Yicong Yang" <yangyicong@hisilicon.com>,
 "Zhou Wang" <wangzhou1@hisilicon.com>,
 "Navneet Singh" <navneetsingh@microsoft.com>, apais@microsoft.com,
 hargar@linux.microsoft.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <e911434a-6b31-4889-b789-79b132e4f067@app.fastmail.com>
In-Reply-To: <CAE5sdEgMSSAnZ+XM+03BfRS4_nZDxcp0hGMPJJWCa0PcGwNwDA@mail.gmail.com>
References: <20261117222224.1465328-1-arnd@kernel.org>
 <20261117222224.1465328-2-arnd@kernel.org>
 <CAE5sdEgMSSAnZ+XM+03BfRS4_nZDxcp0hGMPJJWCa0PcGwNwDA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: add HWCAP3_LS64_ACCDATA
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_082007_336780_7C64CB14 
X-CRM114-Status: GOOD (  13.31  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 22, 2026, at 20:42, Siddharth Chintamaneni wrote:
> On Tue, 17 Nov 2026 at 14:22, Arnd Bergmann <arnd@kernel.org> wrote:
>>
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> LS64_ACCDATA extends the LS64 feature with the user-space ls64bv0 instruction
>> and the EL1 ACCDATA register. Like LS64, it was added with Armv8.7, and it
>> roughly corresponds to the 'enqcmd' feature for shared hardware workqueues
>> on x86 CPUs as described in the kernel's SVA documentation. [1]
>
>
> A few small notes on this patch (the first three were also highlighted by the
> Sashiko review [1]):
>
> - Nit: s/ls64bv0/st64bv0/ in the commit message.

Fixed.

> - Should this come as Patch 2/2 after enabling st64bv0 in the kernel so
>   HWCAP3_LS64_ACCDATA is not advertised to userspace at an intermediate
>   commit?

Right, makes sense.

>> @@ -158,6 +158,7 @@ static const char *const hwcap_str[] = {
>>         [KERNEL_HWCAP_F16F32DOT]        = "f16f32dot",
>>         [KERNEL_HWCAP_F16F32MM]         = "f16f32mm",
>>         [KERNEL_HWCAP_SVE_LUT6]         = "svelut6",
>> +       [KERNEL_HWCAP_LS64_ACCDATA]     = "ls64_accdata",
>
> should we drop underscore to maintain consistency?

makes sense, done.

Thanks a lot!

     arnd

