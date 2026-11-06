Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8760606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 23:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gMT/KKNZ;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=tLYC36c0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=271la5tHm0yDoKq9VHWPu215zumK+27e39jvZgbGqt4=; b=gMT/KKNZ5lwOPbhIh1pRsE2dtg
	9yXkB2pstLfBkNI1ftrh16JGkzGKcdN9BzYOiinC0Nbi6jfW9aooqZ7AiUZ4eAIxo1TisKBw9PENR
	aNk9faArOYh+4M2FchrHlNzH0/+CYfBBUOuzwlmyZ9tqd5oONuyXzJ3n57Mf7OoSIPU5b81A4dnzX
	TyiW8TkFDkLNJXWAeIpnDGkdpyMTJ9iXzJPqvRf/FeBt2h2sz1TFfsTHNzek5WaZXYwa8h2ChsatY
	Y862TUPq8qyQhEPCCaz60OcMW1gol1wgSl/gTS6rSVjd41BJTkb9PlvoQlEGSCpNoCznWQQJnAuLm
	Ei421ieA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPT2m-0000000DpPn-3teh;
	Fri, 06 Nov 2026 23:08:24 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPT2d-0000000DpHQ-3Yqr;
	Fri, 06 Nov 2026 23:08:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1794006474; x=1794611274; i=wahrenst@gmx.net;
	bh=271la5tHm0yDoKq9VHWPu215zumK+27e39jvZgbGqt4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=tLYC36c0Y4OcJ+F3i2mXmVm31KXtfDfrsVEF3u6zkSv+DOjAeGgmNfWAClIuKv7Y
	 +b61A2eMf3i5cJpE6/42mKeMdPt338LxPekw5Gkj92XgnXCARTn44VxeC9Hojd3Lw
	 gIAwAlISJBVyURa77Co4qJyiqS2VIosdfse6Qv9uieEgmPjkBV0rIPVJWhrxm+c0I
	 oQ8TAc56TLGyFCIszXw/PIJd/iIk8hHXIv0Ossa3au+bGcC318m87mcrOkQUVMRyj
	 l5KfgIVCfcLATfTW4cZRYj2y17AfmfcpK9eCl2yuh/k4JbNDORKezGZ5SbeWQbsUv
	 I65kqzgZWL5zWfczUw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MnakX-1wgoMZ2GMX-00cxOR; Sat, 07
 Nov 2026 00:07:54 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Vincent Mailhol <mailhol@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-can@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 0/5] ARM: mxs: add EVAchargeSE board support
Date: Sat,  7 Nov 2026 00:07:40 +0100
Message-ID: <20261106230746.21954-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zvcz+ojS2wfUwCqVHRHUnkRPvyN1LE8zeQrQYGuYX6hvqdsIxUs
 UZFpzQhBlwaIwAJN+6CkLBsMZeQEzLR93Cj6ArRFPF2e4hA4UjV5B43jR7Gy3cSzCMSAYSJ
 QZUqSsNX3wmvj0jdatTQq6KfMhzFExbmVm5FERHn8z/VCnaLMuaseCfk2Eejq+i+xsQ0Gwy
 0KvUopjh25ycLlOLorFXQ==
UI-OutboundReport: notjunk:1;M01:P0:M5241htxIk8=;2HbziJ1aZasGJRvAgnxVrOULUMf oQN/9ULzXkGQAJ017OGTOGeyPSK31h7k29QABAgdhW2oZ1srn4PT00E2bVUa/V+KL5tvEOVb4 pHjDBJtjcEEDhGpFzdT6u/xkTcKI59wTje5JVpMj+KYa/+yz+AuJNgMxcjk0VAqY93bqxCFVt jMRWa6YrVeID/xEOJV6PsFLFluBYOrgKUB+m3l9ZaZuRUQypIc6Yumntsp207ux4uhDaR45WG a0E4gTA5VqqTL7fPhO3bDjLVgJkJtc2MH9+l2wzK9kjBWxXlMQuxFCb/OloQ61Nj/T1rA8GyD Ud1gNN7Wt15/6L7ewn5uhRw9p3tNeT45CNcC5cqXCTn0g544n1Tq6A1RVZsUzb99T0zkAEy34 I9FIBj82Wn0Z0vyPywHl3SAA2qakCb+ZvShRdj3jhX/xJuJr/KRyWAK2NHK7ZD2FdYN4uF3ug MB+5L9roQkN9vzlFnewZynHb26PB5ue+mv+13NAwSxRWUvXpqcrYy0XG3RyB29B4GzEVFV8ve qzdFWEJp/TcURuiwjT2BUaCMznPDnx+kLG4n4Hru3cSBO43sm8uhs7tLtIao/58zfH1v5lkhm DK6wKlk+dmTdP9il6L3ZiqURtqp2rzriVnuJC+abFOtE4oMZgO/0+XjaC86wZzNOgVg4XC0hd 6i09hFm4i9c/gfDkukMDgHJDIu0XnK6WorCEFu4k4eKykflsSgt4jou/JVuC4TJue0ghBq45f OqjvLMMalXHm0zvz4hZ1zAwU92qY53I5Cy5l8tNaqrkLjAa6jPaUgorF79cBklrwJykRiOMUH 1hJnyUsjMwMrOILiSO/+bvRAFmLW/S/sja0nKabdmnOmjOE9jNyw1udcssZ/SNS1/D5ZBPJJy jhJ3TCpPj6zZ+WMXM25QSQhsdlHCka/1doPEGOHglmKI0NxqrybXHIVLpHCzvZiv0qwrP2WTM OEvpvQfAIaLAwjKj9aufD7p5jhDVbwl6vVdeiEhkymuOAs217tIiCqEWi/xSlifDmqGP0ib6Q ERVAkv30KxfYPpNC8PBZh5Yljzry4Sr6Rmx/Bzek1lkWiptT7wiGR9dTYz0fBX/V49sE/nl0C SZjI3qh9vFVyIBLFbxRCUQYrQnTiee8rUhsIu+xX83Un8YuAMq/T0K+qmIQTy2StEW1kb+9y4 nqnr9AmwAqj/pfPBnAB8JNJ2yT9stgN+c/r52zGtep4hZ+yZswbqCLn8wUlqcpl15zDCGSs6k Vs2jsuDlNnuf4M0ckTlies1YJW6trPayDBzVdnZn5rmVjbQ+vXfS7d1LRfhGlsO0O7+CJPNim cnIDYLGCjiYINrOMZcqF4Em/ySVTddaRmKuCMIrSYPGKp3DPApcwTFwnVvO0L5D+sC+PP7ESF NdJoNsQ0gRe8Lu4Aka845Z3R7S7mOh8LlK+Gx+Xi5XsXwAmg6oZo24IcFQeK3i/4uL7153W7M X81cWVPJGhAQ9FU808EoSvWveLNGwY5OGFkkAFwN0HSVy+b76G7qxMhPenpNOvlQOJpfDc1rt 1g/lgf3p34EU06L6nGqSF1Ix4Ac/aeax8ze1HIXbSZtruJk0jxAbTfJIsjqSmaIDaCgpR3cmo 0TATwClpCdC8ouIb/uK2CA7Yq2XxNgcbybHNvFzdiTc56SWFVJRWpyN4KyNMAWVSIrT1S2fnn EWjowBREOLLgMgiE0T/mDXkil70cY2NZK1PvEgO6H2xHXtwoB8jAr/FYcFOCJbnshnjAu+OCs 38xhBV2eBESHrhIaLBvdpLQDnGRDayTvLwirnAbQf72GOpOKadAqY9BYdU/Dy/57DOJptupRD AhZDuSvsTnjMXGSmfvMLWTPERjQfKMSRujaW/NwsZQe01TAKgbulwOV2Prg5am1u9Qt1OQWyC EqKJNKiKG21nhXdnYj8ZgyEAkDoMefFG/WW1iAi0wpB8H94jG559PLhuZ6W2Qm/vaROCblTG0 KDvGodztg6BBY0fLsn9FuFOm/3XJWGiGRF5/tVUJJnk4JINAAcGD+pI4H73Ar1tR0BVehxC30 z3iWGZ7dxpo3vzuc4nB5k8NidVhHF6uuyWVeSPjw6ChGCnWpHenH2llZ/bngoqWzVwA1nccIk kTQIv5wIUk8koOzW6dLkXPNHRHD4Pj80lRSjyWsJdZ3b7dwx6IgNxfrkmQk4G9DsEcrrI8oqY 5zsDrq69RlQvDyR9TVBt0DJJ66cCVNL0CyL4zzm71PTNfTrBjltlSmpzlSLscEBtTv3/vtxmy Ztv4SoJujR5X40lh5Ilbw8SSz2cK8HTv8r7KORkt0UFpUQkorGHPU3IhM1cQYqf5+IyspOnj9 FHtVUETrYlsn77dB/CU0RAbLFdAGAhOvTZfrLQVn5LMWSMLuMgwMCtcFr3l2bpzprwtuvzyVb 2YAHGgz00lGZYP25Yb2VCjoiIr3wDk1dupk456BCrzOc5yNffE9ecurETpL6v+E9DeUFlWlPS Gfaw6kr99pg+AHpH+DzBQOPddGZc9fESS98b2V6aINIqQDYxWJTVzA8XplnocWL4NwjtFeEVM M5y5oCpqakg6TqbHpbVlHefw5MI2l1ezBdsBscsXryVvfIJVR3v8WAV6H/BuV9T4Gy45R4AJx s+2vFrfyZhDixhJNXVBw+O+gOPmOVV6dXFZh+c4Ne+NiFrIUpayh059hHHsM6rPiSxuRVA5yw x9xOBIURHib6bK70HS0VsElRa+AQ7NQOX1YY9W8wdGg17jNrLtlfRQ2cKwvCMttzNGI8Jg1zv Q6Eg4FrIrPhL4L/gqHOlqi9O2UArV8qy73PSj4EcuK0L2LtPK19KGCnb/R8Nh8uL7xf+7LYo1 vffSoZsH3xb9ctPOWtrUtKIzunDNk5P4dy6Hlt/qJJYK0Y91jio9jUvI+P7J5nonCWhxnE/A4 C1JBIOYWcUgALUGCzed0ltmRfrI94i5YjsjagoG7z/iawQZZMqGAFJZcisQzzwWvnFBqS3zar eXfyDF1Hiv0kcZ4wc2NniZ7UrjtpS3oeqqAWIHLf95DC80Ce2mRbdaxrYdUMh5IIGm5LI9/Du 93EhllrhNemTIhdjJN7fM2BQJjM3NtL4ZRZ71CEpbyBuTbVCVTQUf9QfMEu2Av1XGl85dZmEt LuX5+6t6Fh8so2TZLiX31/plLXCIwzlX56q0uGjNrMD449pa92Sk9BF4nSrjstZkZhKTqbBsl YuXHfIKblBV95PpBP7hk67ZLT67Vp7n1t4aTjZPGUuunQwiHob78aU2MG67HaD1iUncfgiahk MqmQKWh+s+tKnCzUoWGD4nMDTuuDJfKii3ls5OabB/poxpM60tfmqTEXTsHXpuF1quak6muRB KX4loVUv2hIhBmFA9/vmtxolYobHJr5p8LkeUwetcx05Q2fx+y0WfYIVbe+JnKgVJkY35etQr fdKkRsosyvdkP1qQ4tkKp9UwH4DV7VF5vsFWZr6fAB4TOeEJnQvTSv8BZosaWE4GRKtn9Vp0W peXyL0VwXriYz2l9AUT6j7LFSy4FZxSZfDQoI2ejThO1wxwQtnqwt2UoxKpJ3LcpCJANVtzls VYmZdlv0hTDmq5GtylW8csWluHqxPKclYaokbMTcJLabgnV47555ykiFe2KPuYWMkyIcZZZql 8zD9BHa5WvEbbYNsm3pJhVwcQp8eucknzJ3d3818/ae1ZNTNmGax3p83xkOWi40F/SE3mCP6X y1K1SFCqkNpMt57QCI8YqDHFZ15mUCoGq7DZTAH5unS+233w2Om/Hx6RDX+SAWsXJLu2yH6BG Uk10CN8mZuySlXuU6Eho7igHWKu4KxDte1sRrZPGuUhlU/2ngytj5zIj7Xb80NQ0Xy6ANQqHF MKpTzD+sZRarxZKpZEGjwCKp3qr4S6fuKtkEMA5yjNgpDTSgOvqnXdGu1sk6BarawwL2zSVwZ
 s1x79p7xiDp3X1GuKSav2p/HG/uILgofb+wacshHJoEe4FlSO2GJnzwADWxcQdGaTaBo4DgPG bdtMhS9BSLoVfRwxGoWb3TxoyiR+d3/rFYUSSoVf/y/f5Nx0zNGhOQAftCAK2mJ2NVSpdHcQK ih6WzWJ1Ke/2IfgLVZvJjcN8mSbkYuaQ87ldtGKiHUlEl2TEkJXrhejlyhaLS6suRPlFDl0+d Vigh4havYXheO83EfdrZEadBn4jtgZzEvCpn3yIjzPNjUeG+zBz5RtFEQjKJFkxeh8ZUgY2GV RCs6Gdfvef40wV7zXvhudfJqSX7qNKGnbdDTsSVaMgoc7yKLO26B2B3Zqi1Zhq2NBSCN5IJF+ k/u7caSmBuV4GrJykXAeUbDoxaKM+Ivev2Qf9xQzs++semxokBp68nPU2aAS+ornLjabUUMyI vfUQc1dE/LUqsoylrgUC+aqeDUMcSfGRtzkCvVB0LTxEtl3EXHqHG+1Iz5MMrlpM+ZoLgtEf5 T7MOJuVqgpnbBz7kpc4BrQ97Z3Ck7e9sJWsNj8FavhWbPXT2CYR2kPTmr+C9nQwzuZl8mv+s1 7zjlrOnF7Y5AeXjxyhtckMiSXojoln16osoOEwyFTcaxELGSVAlzeSh/S77ocD3AFw7vVykDg eK/RVCWI32C7wzMxvfv8ZbxZSyOjxD/SgurE4d4bA5AYKHZ9POnMO6DCq4WFSlfhr0TcHvH7t KEMpY0XDsYjEMVWze5P4yuZDem5iQhEQbGrPINp1EkSMGUaZF63aSK7TcDqgHwRfIMMQRht+x qczhTRMo8Sw02ZEAZxJX5v6YhXeUNfBveK49WXl1FbruMqZ7u+6Kve03GJakizsuVcxfv5wGd 8p8YqR3ONqySV2tbx5htxUIaV2Ea4nw32YqknR2TaPiW9LaMxArBMEb3+0zhZzIRcl9fOLY6I gOJNFcnqOIxL6y8lYXqa8yEOBf1VJpkFWHsqPpa0hEB9ntsgYmGmEUUnAqdxNbkGhHK/cAh6G 6iGga/cscmSnpHR+4Os2rOnB1JHuns6LifT5N5jHU5J/UAQYCJPhjSi6JVUhgetvfeLG/2GXF niw5hKKiU/VYRLJoHhQAziF8PXSRal5C5w77MrfXKCgCGZVPF7+TC8HXCmTEbfUkIn9NoVY2i RAjAPwVXhDrkTLIEBqXG+bjhCEkmJPhu6TYhj6dBj5XMvDaQkax82UjTdsf5wVUDJmlMa3qT/ PgHZPjzY8wqWcVUua1km/WspDtU9SxVFAApGy/52+fbmwP1D69+mI1F6DEgj2fRLixcck90t0 cw9IwbFFjBzzOFEMNaQErDzJm+t8Bj4uiaLGGWWRjjYfvxMm5ukSZKMokhmEpVdIUn3o+F2NV oLg5lROIJHO8MUABMM7Ueof4P4jga18CPbp75MAw5Xq6kiHx5FBy2kH30QBpoHrS3FTPvcr++ PcLRFomDzlTeuAmlJP9CIH6ePiZCED5LoWsrQ3iMaQCr+C4KWiSp3RRvWmQV4drOF7BXH9Vp3 7on9+DmqYP8cwS4Wv7Cpbo3Rw/3+YB2dWuELu9XePUmafS4FK7JELkhgupxaHZQX7q4czHfn/ bZTqWVDFhnHDZ5Z3pBUUv6h/gSUo08TXz9kSw9nDoidaaOxwukyGTM2jiFFKKDkMX5NE7evNU Epkc4FvRMsfFInxP2ZxtWN6915DbJY3dMLqRosbtFD+nhPSe3n07pzHn297Ii/a2+wl0JUKCT g++ZdLc9/72xxJjD2rK5CcT0W2ZaHOvcDFJ2fS8DYDiiFr56lQdS06Tp0lsbKMjtfu5WjCxAc v0fvbdg1q/h32REY5fxqQlrGRO+YYHZxMsCXNbOsdwSx2dyJ8sEsuK+sXzoT+bFBDTEAdzXTy WlkwFJJtPFTBlgP692kk70ZPK1vXEhh0ZunApPsycrX49WwQ5+ortOWVKl31Tr6nO348P0yeb nQKwIOXCcluVRxlhjf0olXGwlFeGJgVJgKvrV9Y/UupXBQPZrWnUgA8o5UBiCkuBuojJe551o fVmvDttgDguB/kxvmBKzq+EdCJda9lot8b8mQMuL6v4TF7i0mn1W01iRDqIdt+LPdJgHxvCLD KdRxgRdpwMLqUgtl9XGZ7Aa6GIPEhBeRzrUYgLmsNIhEmoW6DyzK0OhMgBMitQe1A5/Iv085M pUApkUXsGlAcCP+wt3R/MvyvSgCJPqyAOOMDp1jM7pgF7J248g7+xH73ZRSg7+DYovvPqIAKj EkDPq8yWAgWgRciHlgStPoNNpcYecVDZ15CTCbzkTpPFGLFB69mQcoZ5KtcBZmvxnDCh7JMUY nWw0fIIrrg3TmlzBUZwh/T0Bfo3HkZ79faBj+dKbgXFJgQN2t8XQnuxahVCZ+lBiaSY9m/fgG Faj/MHHghEZCxxA5pbiPFVuqfE0MC0H4yOwiv0Pf7jUpz2vCgqDCwtrM4mVrS6h2JyRdDCbI0 UAuniP6O5HMhGFsvPlhOIulWBRCBXAZWfmP3ttwcdQdXrOvKp4TdDB12MFu+yolw+unE00Eaz F6g17DDZcl5MvRt50xGaNQTFueq1ZDdIUv96me2UNaRpxc2LLLhJkZovJrdGs6de5JibeXHYs MdN9LIdnmqr3v/7QuM9NrTxuCOssYJogQ3eMw0sjGxpG8sJEVt06050knNu7qM+CHLEiuBe1n eJoQGm5T9MHveGBtopWbbq8NUyyBqkRD5O43/Q/dB0eDX00e0EJmGuBjhIjlXg3WzUTxQPBnE 1R1jz+PZC+oDvNZfq9vRYtSjsoWKsu32isWoOaL8xXOrjgHrb955O1U4Pr8SLNswhW2+RH3NA h/KEYmsSLXlykyr2FDOZINo3XSG7NDBB3PtKuYZ4kJPSHzHb6enBDwy52Cq15dqLFNCqE6mFU fo4EtLu94ffgwRACDkh+u4fiuhr0dmi/rOIvpeDYIk0ow==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_150819_172995_5A326800 
X-CRM114-Status: UNSURE (   8.42  )
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds support for the chargebyte EVACharge SE, which is a
ISO 15118 compliant controller for electric vehicle & charging stations.

Stefan Wahren (5):
  dt-bindings: arm: fsl: support chargebyte EVAcharge SE
  dt-bindings: phy: ti,tcan104x-can: Document Microchip MCP2562
  dt-bindings: gpio: mxs: Allow gpio-line-names to be set
  ARM: dts: imx28: add alternative pinmux for CAN1
  ARM: mxs: add EVAchargeSE board support

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 .../devicetree/bindings/gpio/gpio-mxs.yaml    |   4 +
 .../bindings/phy/ti,tcan104x-can.yaml         |   1 +
 arch/arm/boot/dts/nxp/mxs/Makefile            |   1 +
 .../boot/dts/nxp/mxs/imx28-evachargese.dts    | 294 ++++++++++++++++++
 arch/arm/boot/dts/nxp/mxs/imx28.dtsi          |  11 +
 6 files changed, 312 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-evachargese.dts

=2D-=20
2.53.0


